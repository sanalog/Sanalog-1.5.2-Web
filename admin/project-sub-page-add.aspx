<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/project-sub-page-add.aspx.cs" Inherits="admin_proje_alt_bilgi_ekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

            //kaydettikten sonra yeni sayfa açmak için
            $('.icon_kaydetyeniac').click(function () {
                $('[name=HdnYeni]').val('1');
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnYeni" />
    <cc1:ToolkitScriptManager ID="TSM1" runat="server" EnableScriptGlobalization="True">
    </cc1:ToolkitScriptManager>
    <div class="row projeAltBilgiEkle">
        <div class="col-md-12">
            <div class="form">
                <asp:FormView ID="FVIcerik" runat="server" DataKeyNames="ProjeAltId" DataSourceID="SDSPrjSyf"
                    DefaultMode="Edit" >
                    <InsertItemTemplate>
                        <div class="page-head-x4"><%= Resources.admin_language.project_sub_pages_add_title %></div>
                        <div class="page-head-x1"><%= Resources.admin_language.project_sub_pages_add_help %></div>
                        <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                            <div class="col-md-12">
                                <asp:LinkButton CommandName="Insert" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language, save %>" 
                                    class="btn btn-info icon_kaydet"></asp:LinkButton>
                                <a href="project-sub-pages.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                            </div>
                        </div>

                        <div id="global_errors" class="errors-out">
                            <div class="errors-in"></div>
                        </div>


                        <div class="panel">
                            <div class="panel-heading"><%= Resources.admin_language.project_sub_pages_add_form %></div>
                            <div class="panel-body">


                                <div class="col-md-6">
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.heading %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="250" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik"
                                                CssClass="hata" Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle"
                                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_url %></label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                                <span class="input-group-addon"><%= Snlg_ConfigValues.urlExtension %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.project_which %></label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="DDl3" CssClass="form-control" runat="server" DataSourceID="SdsProjeler" DataTextField="Baslik"
                                                DataValueField="ProjeId" SelectedValue='<%# Bind("ProjeId") %>'>
                                            </asp:DropDownList>
                                        </div>
                                    </div>



                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_row %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                            <asp:RangeValidator runat="server" ControlToValidate="TBSira" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="<%$ Resources:admin_language,products_error %>" MaximumValue="255"
                                                MinimumValue="0" Type="Integer" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_meta %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBKey1" CssClass="form-control" runat="server" Text='<%# Bind("Keyword") %>' MaxLength="500" />
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_desc %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBDesc1" CssClass="form-control" runat="server" Text='<%# Bind("Descr") %>' MaxLength="500" />
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
                                    <div class="row form-group-no-border no-gutter">

                                        <div class="col-md-12">
                                            <label><%= Resources.admin_language.article_add_content %></label>
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

                    </InsertItemTemplate>

                    <EditItemTemplate>
                        <div class="page-head-x4"><%= Resources.admin_language.project_sub_pages_edit_title %></div>
                        <div class="page-head-x1"><%= Resources.admin_language.project_sub_pages_edit_help %></div>

                        <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                            <div class="col-md-12">

                                <asp:LinkButton CommandName="Update" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language,save %>" class="btn btn-info"></asp:LinkButton>
                                <asp:LinkButton CommandName="Update" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language,save_new %>" class="btn btn-success icon_kaydetyeniac"> </asp:LinkButton>
                                <asp:LinkButton CommandName="delete" runat="server" Text="<%$ Resources:admin_language,delete %>" class="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                                <a href="project-sub-pages.aspx?pid=<%# Eval("ProjeID") %>" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                            </div>
                        </div>

                        <div id="global_errors" class="errors-out">
                            <div class="errors-in"></div>
                        </div>

                        <div class="panel">
                            <div class="panel-heading"><%= Resources.admin_language.project_sub_pages_edit_form %></div>
                            <div class="panel-body">

                                <div class="col-md-6">
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                        <div class="col-md-6">
                                            <%# DilleriListele(Eval("Diller")) %>
                                        </div>
                                    </div>
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.heading %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="500" />
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik"
                                                CssClass="hata" Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle"
                                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_url %></label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                                <span class="input-group-addon"><%= Snlg_ConfigValues.urlExtension %></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.project_which %></label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="DDl3" CssClass="form-control" runat="server" DataSourceID="SdsProjeler" DataTextField="Baslik"
                                                DataValueField="ProjeId" SelectedValue='<%# Bind("ProjeId") %>'>
                                            </asp:DropDownList>
                                        </div>
                                    </div>



                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_row %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                            <asp:RangeValidator runat="server" ControlToValidate="TBSira" CssClass="hata"
                                                Display="Dynamic" ErrorMessage="<%$ Resources:admin_language,products_row_error %>" MaximumValue="255"
                                                MinimumValue="0" Type="Integer" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                        </div>
                                    </div>

                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_meta %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBKey" CssClass="form-control" runat="server" Text='<%# Bind("Keyword") %>' MaxLength="500" />
                                        </div>
                                    </div>
                                    <div class="row form-group no-gutter">
                                        <label class="col-md-6"><%= Resources.admin_language.article_add_desc %></label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TBDesc" CssClass="form-control" runat="server" Text='<%# Bind("Descr") %>' MaxLength="500" />
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
                                    <div class="row form-group-no-border no-gutter">

                                        <div class="col-md-12">
                                            <label><%= Resources.admin_language.article_add_content %></label>
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

                    </EditItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SDSProjeler" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT snlg_V1.TblProjeApp.ProjeId, snlg_V1.TblProjeDetay.Baslik FROM snlg_V1.TblProjeApp INNER JOIN snlg_V1.TblProjeDetay ON snlg_V1.TblProjeApp.ProjeId = snlg_V1.TblProjeDetay.ProjeId WHERE (snlg_V1.TblProjeDetay.Dil = @DefaultLang) ORDER BY snlg_V1.TblProjeDetay.Baslik">
        <SelectParameters>
            <snlg:ApplicationParameter Name="DefaultLang" AppKeyName="DefaultLangId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSPrjSyf" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_ProjeAltBilgiEkle" InsertCommandType="StoredProcedure"
        SelectCommand="snlg_V1.msp_ProjeAltBilgiDetaySec" SelectCommandType="StoredProcedure"
        OnInserted="SDSPrjSyf_Inserted" UpdateCommand="snlg_V1.msp_ProjeAltBilgiDuzenle"
        UpdateCommandType="StoredProcedure" OnUpdated="SDSPrjSyf_Updated" OnInserting="SDSPrjSyf_Inserting"
        OnUpdating="SDSPrjSyf_Updating" DeleteCommand="DELETE FROM snlg_V1.TblProjeAltBilgiDetay FROM snlg_V1.TblProjeAltBilgiDetay INNER JOIN snlg_V1.TblProjeAltBilgiApp ON snlg_V1.TblProjeAltBilgiDetay.ProjeAltId = snlg_V1.TblProjeAltBilgiApp.ProjeAltId WHERE (snlg_V1.TblProjeAltBilgiApp.ProjeAltId = @ProjeAltId) AND (snlg_V1.TblProjeAltBilgiDetay.Dil = @Dil)"
        OnDeleted="SDSPrjSyf_Deleted" OnDeleting="SDSPrjSyf_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="ProjeAltId" QueryStringField="paltid" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="ProjeAltId" QueryStringField="paltid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="ProjeAltId" QueryStringField="paltid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="Sira" Type="Byte" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="ProjeId" Type="Int32" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Sira" Type="Byte" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="ProjeId" Type="Int32" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
