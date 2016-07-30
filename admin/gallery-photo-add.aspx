<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/gallery-photo-add.aspx.cs" Inherits="admin_galeriyeresimekle" %>

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
    <div class="row galeriResimEkle">
        <div class="col-md-12">

         
            <div class="page-head-x4"><%= Resources.admin_language.gallery_add_photos_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.gallery_add_photos_help %></div>

            <asp:FormView ID="FVResim" runat="server" DataSourceID="SDSResim" DefaultMode="Edit">
                <EditItemTemplate>
                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">

                            <asp:LinkButton CommandName="Update" runat="server" ValidationGroup="galleri"  Text="<%$ Resources:admin_language, save %>" class="btn btn-info"></asp:LinkButton>
                            <asp:LinkButton CommandName="delete" runat="server" Text="<%$ Resources:admin_language, delete %>" class="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                            <a href="<%# Eval("GId","gallery-photos.aspx?gid={0}") %>" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in">
                        </div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.gallery_add_photos %></div>
                        <div class="panel-body">



                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                <div class="col-md-6">
                                    <%# DilleriListele(Eval("Diller")) %>
                                </div>
                            </div>


                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.gallery_select %></label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="DDLGaleri" CssClass="form-control" runat="server" DataSourceID="SdsRGal" DataTextField="GaleriAd"
                                        DataValueField="GId" SelectedValue='<%# Bind("GId") %>'>
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

                                        <asp:LinkButton ID="BtnRSil" runat="server" class="btn btn-danger icon_sil" Visible='<%# !string.IsNullOrEmpty(Eval("Resim").ToString()) %>'
                                            OnClick="BtnRSil_Click" Text="<%$ Resources:admin_language, delete %>" title="Resmi Sil"></asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                              <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_row %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                    <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="TBSira" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language, products_row_error %>" MaximumValue="30000" MinimumValue="0"
                                        Type="Integer" ValidationGroup="galleri" SetFocusOnError="true"></asp:RangeValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.heading %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="150" />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.url_link %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBLink" CssClass="form-control" runat="server" Text='<%# Bind("LinkUrl") %>' MaxLength="250" />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
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


    <asp:SqlDataSource ID="SDSResim" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_GaleriResimDetaySec" SelectCommandType="StoredProcedure"
        UpdateCommand="snlg_V1.msp_GaleriResimDuzenle" UpdateCommandType="StoredProcedure"
        OnUpdated="SDSResim_Updated" OnUpdating="SDSResim_Updating" DeleteCommand="DELETE FROM snlg_V1.TblResimGaleriResimlerDetay FROM snlg_V1.TblResimGaleriResimlerDetay INNER JOIN snlg_V1.TblResimGaleriResimlerApp ON snlg_V1.TblResimGaleriResimlerDetay.RId = snlg_V1.TblResimGaleriResimlerApp.RId WHERE (snlg_V1.TblResimGaleriResimlerApp.RId = @RId) AND (snlg_V1.TblResimGaleriResimlerDetay.Dil = @Dil)"
        OnDeleted="SDSResim_Deleted" OnDeleting="SDSResim_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="RId" QueryStringField="rid" />

        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="RId" QueryStringField="rid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="GId" Type="Int32" />
            <asp:QueryStringParameter Name="RId" QueryStringField="rid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="LinkUrl" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="Sira" Type="String" />
            
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SdsRGal" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT [GId], [GaleriAd] FROM snlg_V1.TblResimGaleriApp ORDER BY [GaleriAd]">
        <SelectParameters>
        </SelectParameters>
    </asp:SqlDataSource>

    
</asp:Content>
