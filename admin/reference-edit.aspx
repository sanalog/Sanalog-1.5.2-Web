<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/reference-edit.aspx.cs" Inherits="admin_referansduzenle" %>

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
    <input type="hidden" name="HdnYeni" />
    <div class="row referansDuzenle">
        <div class="col-md-12">

            <asp:FormView ID="FVResim" runat="server" DataKeyNames="RId" DataSourceID="SdsRef"
                DefaultMode="Edit">
                <InsertItemTemplate>

                    <div class="page-head-x4"><%= Resources.admin_language.ref_add_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.ref_add_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton CommandName="Insert" ValidationGroup="rekle" runat="server" Text="<%$ Resources:admin_language, save %>" 
                                class="btn btn-info icon_kaydet"></asp:LinkButton>
                            <a href="references.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>




                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.ref_add_name %></div>
                        <div class="panel-body">


                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_aspx_cat %></label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="DDLKtg" CssClass="form-control" runat="server" DataSourceID="SdsKtg" DataTextField="KtgAd"
                                        DataValueField="KtgId" SelectedValue='<%# Bind("KtgId") %>'>
                                    </asp:DropDownList>
                                </div>
                            </div>


                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                <div class="col-md-6">
                                    <p>
                                        <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />                                                    
                                        <img src="" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />                                                           
                                        <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVResim.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>

                                    </p>
                                </div>
                            </div>


                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.mark %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBFirma" CssClass="form-control" runat="server" Text='<%# Bind("Firma") %>' MaxLength="250" />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.ref_web_url %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TWeb" CssClass="form-control" runat="server" Text='<%# Bind("Link") %>' MaxLength="250" />
                                </div>
                            </div>

                            <div class="row form-group-no-border no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_small_content %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="500" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>


                        </div>
                    </div>

                </InsertItemTemplate>
                <EditItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.ref_edit_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.ref_edit_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton CommandName="Update" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info"></asp:LinkButton>
                            <asp:LinkButton CommandName="delete" runat="server" Text="<%$ Resources:admin_language, delete %>" class="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                            <asp:LinkButton CommandName="Update" runat="server" Text="<%$ Resources:admin_language, save_new %>" class="btn btn-success icon_kaydetyeniac"></asp:LinkButton>
                            <a href="references.aspx?cid=<%# Eval("KtgId") %>" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                        </div>
                    </div>


                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.ref_edit_title %></div>
                        <div class="panel-body">



                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                <div class="col-md-6">
                                    <%# DilleriListele(Eval("Diller")) %>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_aspx_cat %></label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="DDLKtg" CssClass="form-control" runat="server" DataSourceID="SdsKtg" DataTextField="KtgAd"
                                        DataValueField="KtgId" SelectedValue='<%# Bind("KtgId") %>'>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                <div class="col-md-6">
                                    <p>
                                       <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />
                                       <img src='<%# Eval("Resim") %>' style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                       <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVResim.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a> 
                                     </p>
                                    <p>
                                        <asp:LinkButton runat="server" Text="<%$ Resources:admin_language, activity_image_delete %>" CssClass="btn btn-sm btn-danger" Visible='<%# !string.IsNullOrEmpty(Eval("Resim").ToString()) %>'
                                            OnClick="LinkRSil_Click"></asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.company_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBFirma" CssClass="form-control" runat="server" Text='<%# Bind("Firma") %>' MaxLength="250" />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.ref_web_url %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TWeb" CssClass="form-control" runat="server" Text='<%# Bind("Link") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group-no-border no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_small_content %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="500" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>

                        </div>
                    </div>


                </EditItemTemplate>


            </asp:FormView>


        </div>
    </div>


    <asp:SqlDataSource ID="SdsRef" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_ReferansEkle" InsertCommandType="StoredProcedure"
        SelectCommand="snlg_V1.msp_ReferansDetaySec" SelectCommandType="StoredProcedure"
        OnInserted="SdsRef_Inserted" UpdateCommand="snlg_V1.msp_ReferansDuzenle" UpdateCommandType="StoredProcedure"
        OnUpdated="SdsRef_Updated" OnInserting="SdsRef_Inserting" OnUpdating="SdsRef_Updating"
        DeleteCommand="DELETE FROM snlg_V1.TblReferansDetay FROM snlg_V1.TblReferansDetay INNER JOIN snlg_V1.TblReferansapp ON snlg_V1.TblReferansDetay.RId = snlg_V1.TblReferansapp.RId WHERE (snlg_V1.TblReferansapp.RId = @RId) AND (snlg_V1.TblReferansDetay.Dil = @Dil)"
        OnDeleted="SdsRef_Deleted" OnDeleting="SdsRef_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="RId" QueryStringField="rid" />

        </DeleteParameters>
        <SelectParameters>

            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="RId" QueryStringField="rid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>

            <asp:Parameter Name="KtgId" Type="Int32" />
            <asp:QueryStringParameter Name="RId" QueryStringField="rid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="Firma" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
        </UpdateParameters>
        <InsertParameters>

            <asp:Parameter Name="KtgId" Type="Int32" />
            <asp:Parameter Name="Firma" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SdsKtg" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT snlg_V1.TblReferansKtgApp.KtgId, snlg_V1.TblReferansKtgDetay.KtgAd FROM snlg_V1.TblReferansKtgApp LEFT OUTER JOIN snlg_V1.TblReferansKtgDetay ON snlg_V1.TblReferansKtgApp.KtgId = snlg_V1.TblReferansKtgDetay.KtgId AND snlg_V1.TblReferansKtgDetay.Dil = @DefaultLang ORDER BY snlg_V1.TblReferansKtgDetay.KtgAd">
        <SelectParameters>
            <snlg:ApplicationParameter Name="DefaultLang" AppKeyName="DefaultLangId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
