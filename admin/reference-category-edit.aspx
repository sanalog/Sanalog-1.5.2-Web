<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/reference-category-edit.aspx.cs" Inherits="admin_duyuruduzenle" %>

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
    <div class="row referansKategoriDuzenle">
        <div class="col-md-12">



            <asp:FormView ID="FVKtg" runat="server" DataKeyNames="KtgId" DataSourceID="SDSKtg"
                DefaultMode="Edit">
                <InsertItemTemplate>


                    <div class="page-head-x4"><%= Resources.admin_language.ref_cat_add_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.ref_cat_add_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton CommandName="Insert" ValidationGroup="rekle" runat="server" Text="<%$ Resources:admin_language, save %>" CssClass="btn btn-info icon_kaydet"></asp:LinkButton>
                            <a href="reference-categories.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>


                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.ref_cat_add %></div>
                        <div class="panel-body">


                            <div class="row form-group-no-border no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_cat_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBKtgAd" CssClass="form-control" runat="server" Text='<%# Bind("KtgAd") %>' MaxLength="150" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TBKtgAd" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="rekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>



                        </div>
                    </div>

                </InsertItemTemplate>





                <EditItemTemplate>




                    <div class="page-head-x4"><%= Resources.admin_language.ref_cat_edit_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.ref_cat_edit_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton CommandName="Update" ValidationGroup="rekle" runat="server" Text="<%$ Resources:admin_language, save %>" CssClass="btn btn-info icon_kaydet"></asp:LinkButton>
                            <asp:LinkButton CommandName="Update" ValidationGroup="rekle" runat="server" Text="<%$ Resources:admin_language, save_new %>" CssClass="btn btn-success icon_kaydetyeniac"></asp:LinkButton>
                            <asp:LinkButton CommandName="delete" runat="server" Text="<%$ Resources:admin_language, delete %>" CssClass="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                            <a href="reference-categories.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>


                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.ref_cat_edit %></div>
                        <div class="panel-body">


                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                <div class="col-md-6">
                                    <%# DilleriListele(Eval("Diller")) %>
                                </div>
                            </div>
                            <div class="row form-group-no-border no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_cat_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBKtgAd" CssClass="form-control" runat="server" Text='<%# Bind("KtgAd") %>' MaxLength="150" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TBKtgAd" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="rekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>



                        </div>
                    </div>


                </EditItemTemplate>



            </asp:FormView>



        </div>
    </div>

    <asp:SqlDataSource ID="SDSKtg" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_ReferansKtgEkle" InsertCommandType="StoredProcedure"
        SelectCommand="snlg_V1.msp_ReferansKtgDetaySec" SelectCommandType="StoredProcedure"
        OnInserted="SDSKtg_Inserted"
        UpdateCommand="snlg_V1.msp_ReferansKtgDuzenle" UpdateCommandType="StoredProcedure"
        OnUpdated="SDSKtg_Updated" DeleteCommand="DELETE FROM snlg_V1.TblReferansKtgDetay FROM snlg_V1.TblReferansKtgDetay INNER JOIN snlg_V1.TblReferansKtgApp ON snlg_V1.TblReferansKtgDetay.KtgId = snlg_V1.TblReferansKtgApp.KtgId WHERE (snlg_V1.TblReferansKtgApp.KtgId = @KtgId) AND (snlg_V1.TblReferansKtgDetay.Dil = @Dil)"
        OnDeleted="SDSKtg_Deleted" OnDeleting="SDSKtg_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="KtgId" QueryStringField="ktgid" />

        </DeleteParameters>
        <SelectParameters>

            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="KtgId" QueryStringField="ktgid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>

            <asp:QueryStringParameter Name="KtgId" QueryStringField="ktgid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="KtgAd" Type="String" />

        </UpdateParameters>
        <InsertParameters>

            <asp:Parameter Name="KtgAd" Type="String" />
            <asp:Parameter Name="KtgId" Type="Int32" Direction="Output" DefaultValue="0" />

        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
