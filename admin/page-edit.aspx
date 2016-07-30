<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="page-edit.aspx.cs" Inherits="admin_sayfaduzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            //kaydettikten sonra yeni sayfa açmak için
            $('.icon_kaydetyeniac').click(function () {
                $('[name=HdnYeni]').val('1');
            });
        });

        function fun_sablonaGit() {
            window.open('template-design.aspx?sablonDesignId=' + $(".ddlSablon").val() + '&sAd=' + $(".ddlSablon [value=" + $(".ddlSablon").val() + "]").text(), '_blank');
        }

        function getHTML() {
            var display = $('#testID option:selected').html();
            bootbox.alert(display);
        }



        $(document).ready(function () {
            var editor = CKEDITOR.instances.ctl00_CPH1_FVSyf_CKEditorControl1;
            if (editor) {
                editor.destroy(true);
            }

            CKEDITOR.replace("ctl00_CPH1_FVSyf_CKEditorControl1", {
                filebrowserBrowseUrl: roxyFileman,
                filebrowserImageBrowseUrl: roxyFileman + '&type=image',
                removeDialogTabs: 'link:upload;image:upload',
                height: "100",
                // Define the toolbar groups as it is a more accessible solution.
                toolbarGroups: [
                    { "name": "document", "groups": ["mode", "Source"] },
                    { "name": "basicstyles", "groups": ["basicstyles"] },
                    { "name": "links", "groups": ["links"] },
                    { "name": "insert", "groups": ["insert"] },
                    { "name": "styles", "groups": ["styles"] }
                ],
                // Remove the redundant buttons from toolbar groups defined above.
                removeButtons: 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar',

            });

        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnYeni" />
    <div class="row sayfaDuzenle">
        <div class="col-md-12">

            <asp:FormView ID="FVSyf" runat="server" DataKeyNames="SayfaId" DataSourceID="SDSSyf"
                DefaultMode="Edit" OnDataBound="FVSyf_DataBound">
                <EditItemTemplate>

                    <div class="page-head-x4"><%= Resources.admin_language.pages_edit_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.pages_edit_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Update" ValidationGroup="sduzenle" runat="server" class="btn btn-info icon_kaydet"><%= Resources.admin_language.save %></asp:LinkButton>
                            <asp:LinkButton CommandName="Update" ValidationGroup="sduzenle" runat="server" class="btn btn-success icon_kaydetyeniac"> <%= Resources.admin_language.save_new %></asp:LinkButton>
                            <asp:LinkButton CommandName="delete" runat="server" class="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"> <%= Resources.admin_language.delete %></asp:LinkButton>
                            <a href="pages.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in">
                        </div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.pages_propertis %></div>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row form-group no-gutter flags ">
                                        <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                        <div class="col-md-6"><%# DilleriListele(Eval("Diller")) %></div>
                                    </div>

                                    <div class="row form-group no-gutter">

                                        <label class="col-md-6"><%= Resources.admin_language.pages_templates %></label>

                                        <div class="col-md-5">
                                            <asp:DropDownList ID="ddlSablon" CssClass="form-control ddlSablon" runat="server" DataSourceID="SdsSablon" DataTextField="SablonAd"
                                                DataValueField="SablonId" SelectedValue='<%# Bind("SablonId") %>'>
                                            </asp:DropDownList>
                                        </div>


                                        <div class="col-md-1 text-right">

                                            <a onclick="fun_sablonaGit();"
                                                href="javascript:;" title="Şablonu Düzenle" class="btn btn-warning"><i class="fa fa-edit"></i></a>
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlSablon" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="sduzenle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.pages_des_name %></label>
                                        <div class="col-md-6">

                                            <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="200" Text='<%# Bind("SAd") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="sduzenle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.pages_url %></label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" MaxLength="200" Text='<%# Bind("SeoUrl") %>'></asp:TextBox>
                                                <span class="input-group-addon"><%= Snlg_ConfigValues.urlExtension %></span>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="sduzenle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.pages_windows_title %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBTit" CssClass="form-control" runat="server" MaxLength="500" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_meta %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBKey" CssClass="form-control" runat="server" MaxLength="500" Text='<%# Bind("Keyword") %>'></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_desc %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBDesc" CssClass="form-control" runat="server" MaxLength="500" Text='<%# Bind("Descr") %>'></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_index %></label>
                                        <div class="col-md-6">
                                            <asp:CheckBox ID="CBA" runat="server" Checked='<%# Bind("AramaIndex") %>' />
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                        <div class="col-md-6">
                                            <div class="gorunurluk">
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="RBL1" CssClass="hata" Display="Dynamic" ErrorMessage="*" ValidationGroup="sduzenle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RadioButtonList ID="RBL1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'>
                                                    <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row form-group no-gutter">
                                        <div class="col-md-12">

                                            <label><%= Resources.admin_language.pages_windows_PCtitle %></label>
                                            <div class="ckEditor">
                                                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" BasePath="/plugins/ckeditor/"
                                                    CssClass="CKEditor" Text='<%# Bind("PageContentTitle") %>'>
                                                </CKEditor:CKEditorControl>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row form-group no-gutter">
                                        <div class="col-md-12">
                                            <label><%= Resources.admin_language.pages_edit_content %></label>
                                            <div class="ckEditor">
                                                <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                                    CssClass="CKEditor" Text='<%# Bind("Icerik") %>'>
                                                </CKEditor:CKEditorControl>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.pages_add_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.pages_add_help %></div>
                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Insert" ValidationGroup="sekle" runat="server" class="btn btn-info icon_kaydet"> <%= Resources.admin_language.save %></asp:LinkButton>
                            <a href="pages.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in">
                        </div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.pages_propertis %></div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.pages_templates %></label>
                                        <div class="col-md-5">
                                            <asp:DropDownList ID="ddlSablon" CssClass="form-control ddlSablon" runat="server" DataSourceID="SdsSablon" DataTextField="SablonAd"
                                                DataValueField="SablonId" SelectedValue='<%# Bind("SablonId") %>'>
                                            </asp:DropDownList>

                                        </div>
                                        <div class="col-md-1 text-right">
                                            <a onclick="fun_sablonaGit();"
                                                href="javascript:;" title="Şablonu Düzenle" class="btn btn-warning"><i class="fa fa-edit"></i></a>

                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlSablon" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </div>

                                    </div>
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.pages_des_name %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBAd" CssClass="form-control" runat="server" MaxLength="200" Text='<%# Bind("SAd") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TBAd" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.pages_url %></label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" MaxLength="200" Text='<%# Bind("SeoUrl") %>'></asp:TextBox>
                                                <span class="input-group-addon"><%= Snlg_ConfigValues.urlExtension %></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.pages_windows_PCtitle %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBPCTit" CssClass="form-control" runat="server" MaxLength="500" Text='<%# Bind("PageContentTitle") %>'></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_meta %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBKey" CssClass="form-control" runat="server" Text='<%# Bind("Keyword") %>' MaxLength="500"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_desc %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBDesc" CssClass="form-control" runat="server" Text='<%# Bind("Descr") %>' MaxLength="500"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_index %></label>
                                        <div class="col-md-6">
                                            <asp:CheckBox ID="CBA" runat="server" Checked='<%# Bind("AramaIndex") %>' />
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.add_view %></label>
                                        <div class="col-md-6 gorunurluk">
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="RBL1" CssClass="hata" Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:RadioButtonList ID="RBL1" runat="server" SelectedValue='<%# Bind("Gorunurluk") %>'>
                                                <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                                <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                                <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                            </asp:RadioButtonList>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="row form-group no-gutter">
                                        <div class="col-md-12">
                                            <label><%= Resources.admin_language.pages_windows_PCtitle %></label>
                                            <div class="ckEditor">
                                                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" BasePath="/plugins/ckeditor/"
                                                    CssClass="CKEditor" Text='<%# Bind("PageContentTitle") %>'></CKEditor:CKEditorControl>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <div class="col-md-12">
                                            <label><%= Resources.admin_language.pages_edit_content %></label>

                                            <div class="ckEditor">
                                                <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                                    CssClass="CKEditor" Text='<%# Bind("Icerik") %>'>
                                                </CKEditor:CKEditorControl>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    </div>
                </InsertItemTemplate>
            </asp:FormView>

        </div>
    </div>
    <asp:SqlDataSource ID="SdsSablon" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT SablonId, SablonAd FROM snlg_V1.TblDesignSablonlar ORDER BY SablonAd">
        <SelectParameters>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSSyf" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_SayfaDetaySec" SelectCommandType="StoredProcedure"
        InsertCommand="snlg_V1.msp_SayfaOlustur" InsertCommandType="StoredProcedure"
        OnSelected="SDSSyf_Selected" UpdateCommand="snlg_V1.msp_SayfaDuzenle" UpdateCommandType="StoredProcedure"
        OnInserted="SDSSyf_Inserted" OnUpdated="SDSSyf_Updated" DeleteCommand="DELETE FROM snlg_V1.TblSayfaDetay FROM snlg_V1.TblSayfaDetay INNER JOIN snlg_V1.TblSayfaApp ON snlg_V1.TblSayfaDetay.SId = snlg_V1.TblSayfaApp.SId WHERE (snlg_V1.TblSayfaApp.SId = @SId) AND (snlg_V1.TblSayfaDetay.Dil = @Dil)"
        OnDeleted="SDSSyf_Deleted" OnDeleting="SDSSyf_Deleting">
        <SelectParameters>
            <asp:QueryStringParameter Name="SayfaId" Type="Int32" QueryStringField="SId" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
        </SelectParameters>
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="SId" QueryStringField="sid" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="SAd" Type="String" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="SablonId" Type="Int16" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
            <asp:Parameter Name="PageContentTitle" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="SAd" Type="String" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="SablonId" Type="Int16" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="SayfaId" Type="Int32" QueryStringField="sid" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
            <asp:Parameter Name="PageContentTitle" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
