<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/article-edit.aspx.cs" Inherits="admin_makaleekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

            //kaydettikten sonra yeni sayfa açmak için
            $('.icon_kaydetyeniac').click(function () {
                $('[name=HdnYeni]').val('1');
            });

            $('textarea[limit]').keyup(function (e) {
                var limit = $(this).attr('limit');
                if ($(this).val().length >= limit) {
                    if (e.keyCode != 8 && e.keyCode != 46)
                        e.preventDefault();
                    $(this).val($(this).val().substring(0, limit));
                }
                $('#' + $(this).attr('span')).text(limit - $(this).val().length);
            }).keydown(function (e) {
                var limit = $(this).attr('limit');
                if ($(this).val().length >= limit) {
                    if (e.keyCode != 8 && e.keyCode != 46)
                        e.preventDefault();
                    $(this).val($(this).val().substring(0, limit));
                }
                $('#' + $(this).attr('span')).text(limit - $(this).val().length);
            });
        });
    </script>

  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <cc1:ToolkitScriptManager ID="TSM1" runat="server" EnableScriptGlobalization="True">
    </cc1:ToolkitScriptManager>

    <div class="row makaleDuzenle">
        <div class="col-md-12">
            <asp:FormView ID="FVIcerik" runat="server" DataKeyNames="MakId" DataSourceID="SDSMak"
                DefaultMode="Edit" OnDataBound="FVIcerik_DataBound">
                <InsertItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.article_form_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.article_form_help %></div>
                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton ID="LinkButton1" CommandName="Insert" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language, save %>" alt="Ekle" CssClass="btn btn-info icon_kaydet"></asp:LinkButton>
                            <a href="/admin/articles.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in">
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.article_add_form %></div>
                        <div class="panel-body">

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_name %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="250" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>


                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_url %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />

                                    </div>
                                </div>


                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_img %></label>
                                    <div class="col-md-8">
                                        <p>
                                            <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />
                                             <img src="" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                            <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVIcerik.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>
                                        </p>
                                    </div>
                                </div>


                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_small_content %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                            TextMode="MultiLine" limit="750" span="TBilgiSay" />
                                        <br />
                                        <span class="spanlimit" id="TBilgiSay" />
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_cat %></label>
                                    <div class="col-md-8">
                                        <asp:ListBox ID="ListKtg" CssClass="form-control list long" runat="server" Rows="8" SelectionMode="Multiple"></asp:ListBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListKtg" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_row %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TBSira" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language,products_row_error %>" MaximumValue="30000" MinimumValue="0"
                                            Type="Integer" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_date %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TbTarih" CssClass="form-control" runat="server" Text='<%# Bind("Tarih") %>' MaxLength="15" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TbTarih" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language,date_error %>" MaximumValue="1.1.2100"
                                            MinimumValue="1.1.1900" Type="Date" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                        <cc1:CalendarExtender ID="CE1" runat="server" TargetControlID="TbTarih">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_meta %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBKey1" CssClass="form-control" runat="server" Text='<%# Bind("Keyword") %>' MaxLength="500" />
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_desc %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBDesc1" CssClass="form-control" runat="server" Text='<%# Bind("Descr") %>' MaxLength="500" />
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_index %></label>
                                    <div class="col-md-8">
                                        <asp:CheckBox ID="CBA" runat="server" Checked='<%# Bind("AramaIndex") %>' />
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.add_view %></label>
                                    <div class="col-md-8">
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
                    <div class="page-head-x4"><%= Resources.admin_language.article_edit_form_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.article_edit_help %></div>
                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton ID="LinkButton5" CommandName="Update" ValidationGroup="makekle" runat="server" alt="Kaydet" CssClass="btn btn-info icon_kaydet" Text="<%$ Resources:admin_language, save %>"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton6" CommandName="Update" ValidationGroup="makekle" runat="server" alt="Kaydet ve yeni ekle" CssClass="btn btn-success icon_kaydetyeniac" Text="<%$ Resources:admin_language, save_new %>"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton7" CommandName="delete" runat="server" alt="Sil" Text="<%$ Resources:admin_language,delete %>" CssClass="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>'></asp:LinkButton>
                            <a href="/admin/articles.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>

                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in">
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.article_edit_form %></div>
                        <div class="panel-body">

                            <div class="col-md-6">
                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.edit_lang %></label>
                                    <div class="col-md-8">
                                        <%# DilleriListele(Eval("Diller")) %>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_name %></label>
                                    <div class="col-md-8">

                                        <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="500" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>

                                    </div>
                                </div>


                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_url %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_img %></label>
                                    <div class="col-md-8">
                                        <p>
                                             <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />
                                             <img src='<%# Eval("Resim") %>' style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                             <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVIcerik.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>
                                        </p>
                                        <p>
                                            <asp:LinkButton ID="LinkRSil" runat="server" CssClass="btn btn-default" Text="<%$ Resources:admin_language, activity_image_delete %>" Visible='<%# !string.IsNullOrEmpty(Eval("Resim").ToString()) %>'
                                                OnClick="LinkRSil_Click"></asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_small_content %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                            TextMode="MultiLine" limit="750" span="TBilgiSay" />
                                        <br />
                                        <span class="spanlimit" id="TBilgiSay" />
                                    </div>
                                </div>
                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_cat %></label>
                                    <div class="col-md-8">
                                        <asp:ListBox ID="ListKtg" CssClass="form-control list long" runat="server" Rows="8" SelectionMode="Multiple"></asp:ListBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListKtg" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>



                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_row %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TBSira" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language, products_row_error %>" MaximumValue="30000" MinimumValue="0"
                                            Type="Integer" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_date %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TbTarih" CssClass="form-control" runat="server" Text='<%# Bind("Tarih", "{0:d}") %>' MaxLength="15" />
                                        <asp:RangeValidator runat="server" ControlToValidate="TbTarih" CssClass="hata" Display="Dynamic"
                                            ErrorMessage="<%$ Resources:admin_language, article_date_error %>" MaximumValue="1.1.2100"
                                            MinimumValue="1.1.1900" Type="Date" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                        <cc1:CalendarExtender ID="CE2" runat="server" TargetControlID="TbTarih">
                                        </cc1:CalendarExtender>
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_meta %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBKey" CssClass="form-control" runat="server" Text='<%# Bind("Keyword") %>' MaxLength="500" />
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_desc %></label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="TBDesc" CssClass="form-control" runat="server" Text='<%# Bind("Descr") %>' MaxLength="500" />
                                    </div>
                                </div>


                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.article_add_index %></label>
                                    <div class="col-md-8">
                                        <asp:CheckBox ID="CBA" runat="server" Checked='<%# Bind("AramaIndex") %>' />
                                    </div>
                                </div>

                                <div class="row form-group no-gutter">
                                    <label class="col-md-4"><%= Resources.admin_language.add_view %></label>
                                    <div class="col-md-8">
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
                                        <label><%= Resources.admin_language.article_add_content %></label>
                                        <div class="sayfaIcerik">
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



            </asp:FormView>


        </div>
    </div>
    <asp:SqlDataSource ID="SDSMak" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_MakaleEkle" InsertCommandType="StoredProcedure" SelectCommand="snlg_V1.msp_MakaleDetaySec"
        SelectCommandType="StoredProcedure" OnInserted="SDSMak_Inserted" UpdateCommand="snlg_V1.msp_MakaleDuzenle"
        UpdateCommandType="StoredProcedure" OnUpdated="SDSMak_Updated" OnInserting="SDSMak_Inserting"
        OnUpdating="SDSMak_Updating" DeleteCommand="DELETE FROM snlg_V1.TblMakaleDetay FROM snlg_V1.TblMakaleDetay INNER JOIN snlg_V1.TblMakaleApp ON snlg_V1.TblMakaleDetay.MakId = snlg_V1.TblMakaleApp.MakId WHERE (snlg_V1.TblMakaleApp.MakId = @MakId) AND (snlg_V1.TblMakaleDetay.Dil = @Dil)"
        OnDeleted="SDSMak_Deleted" OnDeleting="SDSMak_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="MakId" QueryStringField="makId" />

        </DeleteParameters>
        <SelectParameters>

            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="MakId" QueryStringField="makid" Type="Int32" />
            <asp:SessionParameter Name="YazarId" Type="Int32" SessionField="UserId" />
            <asp:Parameter Name="AdminId" Type="Int32" DefaultValue="<%$ AppSettings:AdminId %>" />
        </SelectParameters>
        <UpdateParameters>

            <asp:QueryStringParameter Name="MakId" QueryStringField="makid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="KtgSql" Type="String" />
            <asp:Parameter Name="Sira" Type="Int16" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
            <asp:Parameter Name="Tarih" Type="DateTime" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>

            <asp:Parameter Name="KtgSql" Type="String" />
            <asp:Parameter Name="Sira" Type="Int16" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Icerik" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
            <asp:SessionParameter Name="YazarId" Type="Int32" SessionField="UserId" />
            <asp:Parameter Name="Tarih" Type="DateTime" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
            <asp:Parameter Name="MakId" Type="Int32" Direction="Output" DefaultValue="0" />
        </InsertParameters>
    </asp:SqlDataSource>
    <input type="hidden" name="HdnYeni" />
</asp:Content>
