<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="gallery-photos.aspx.cs" Inherits="admin_galeridekiresimler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

                        $('body').on("click", ".table tr", function (e) {
                if (e.target.tagName == "TD") {
                    $("input[rel=Sec]").prop('checked', false);
                    $(this).closest('tr').find('input[rel=Sec]').prop('checked', 'checked');
                    $('.icon_duzenle').click();
                }
            });

            $('body').on("click", ".icon_sil", function () {
                if ($('input[rel=Sec]:checked').length < 1) {
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                    return;
                }

                bootbox.confirm("Silmek istediğinizden emin misiniz?", function (result) {
                    if (result != true)
                        return;

                    $('[name=HdnSil]').val('');
                    $('input[rel=Sec]:checked').each(function () {
                        $('[name=HdnSil]').val($('[name=HdnSil]').val() + $(this).val() + ',');
                    });
                    $('[name=HdnSil]').val($('[name=HdnSil]').val().substring(0, $('[name=HdnSil]').val().length - 1));
                    $('form').submit();
                });
            });

            $('body').on("change", "input[rel=TSec]", function () {
                $("input[rel=Sec]").prop('checked', $(this).is(':checked'));
            });

            $('body').on("click", ".icon_duzenle", function () {
                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else
                    window.location.href = "gallery-photo-add.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&rid=" + $('input[rel=Sec]:checked:first').val();
                //window.open("gallery-photo-add.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&rid=" + $('input[rel=Sec]:checked:first').val(), "_blank");
            });

        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row galeridekiResimler">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.gallery_photos_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.gallery_photos_help %></div>



            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <a href="javascript:;" class="btn btn-warning icon_order" onclick="SnlgGdvSiralama();"><%= Resources.admin_language.icon_sorting %></a>
                    <a href="javascript:;" class="btn btn-info icon_duzenle"> <%= Resources.admin_language.edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"> <%= Resources.admin_language.delete %></a>
                   

                     <asp:HiddenField ID="HdnImg" runat="server" />
                    <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni" onclick="SnlgOpenSingleManager('<%=HdnImg.ClientID %>');  "><%= Resources.admin_language.products_photo_add %></a>

                    <asp:Button ID="BtnSaveImage" runat="server" CssClass="btnFMSave" Style="display: none;" OnClick="BtnSaveImage_Click" />
                     <a href="photo-galleries.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                </div>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>



            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.gallery_photos %></div>
                <div class="panel-body">

                    <asp:GridView ID="GVResim" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="RId"
                        DataSourceID="SDSResim" GridLines="None" AllowPaging="True" OnDataBound="GVResim_DataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("RId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:admin_language, article_add_img %>" ItemStyle-CssClass="resim" HeaderStyle-CssClass="resim">
                                <ItemTemplate>
                                    <asp:Image ID="ImgResim" ImageUrl='<%# Eval("Resim", "~{0}") %>'
                                        runat="server" Style="max-height: 50px; margin: 0 auto;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Baslik" HeaderText="<%$ Resources:admin_language, web_cont_name %>" ItemStyle-CssClass="baslik" />
                        </Columns>
                                <PagerTemplate>
                                    <nav>
                                        <ul class="pagination" >
                                            <li><asp:LinkButton runat="server" ID="IlkPage" CommandName="First" aria-hidden="true" >&laquo;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="geri" CommandName="Prev"   aria-hidden="true" >&#8249;</asp:LinkButton> </li>
                                            <asp:PlaceHolder ID="Sayfalama" runat="server" />
                                            <li><asp:LinkButton runat="server" ID="ileri"  CommandName="Next" aria-hidden="true" >&#8250;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="SonPage" CommandName="Last"   aria-hidden="true" >&raquo;</asp:LinkButton></li>
                                        </ul>
                                  </nav>
                                </PagerTemplate>
                        <RowStyle CssClass="satir" />
                        <AlternatingRowStyle CssClass="aSatir" />
                        <EditRowStyle CssClass="eSatir" />
                        <SelectedRowStyle CssClass="seciliSatir" />
                        
                        <HeaderStyle CssClass="baslikSatir" />
                    </asp:GridView>

                </div>
            </div>

        </div>
    </div>
    <input type="hidden" name="HdnSil" />
    <asp:SqlDataSource ID="SdsKtg" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT [GId], [GaleriAd],Sira FROM snlg_V1.TblResimGaleriApp ORDER BY [GaleriAd]">
        <SelectParameters>
        </SelectParameters>
          
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSResim" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT snlg_V1.TblResimGaleriResimlerApp.RId, snlg_V1.TblResimGaleriResimlerApp.Resim,snlg_V1.TblResimGaleriResimlerApp.Sira, snlg_V1.TblResimGaleriResimlerDetay.Baslik FROM snlg_V1.TblResimGaleriResimlerApp LEFT OUTER JOIN snlg_V1.TblResimGaleriResimlerDetay ON snlg_V1.TblResimGaleriResimlerApp.RId = snlg_V1.TblResimGaleriResimlerDetay.RId AND snlg_V1.TblResimGaleriResimlerDetay.Dil = @DefaultLang WHERE (snlg_V1.TblResimGaleriResimlerApp.GId = @GId) ORDER BY snlg_V1.TblResimGaleriResimlerApp.Sira ASC">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="gid" Name="GId" Type="Int32" />
            <snlg:ApplicationParameter Name="DefaultLang" AppKeyName="DefaultLangId" />
        </SelectParameters>
    </asp:SqlDataSource>


    <div id="modalSnlgGdvSiralama" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                       <div class="modal-header">
                          <button type="button" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title" id="myModalLabel"><%= Resources.admin_language.gallery_photos_title %>  </h4>
                        </div>
                       <div class="modal-body" style="height:600px;">
                            <div  style="width:100%; height:100%;">
                                   <asp:GridView ID="GrdSiralama" class="gdvSirala table table-bordered table-striped" runat="server"
                                    AutoGenerateColumns="False"
                                     DataKeyNames="RId">
                                    <Columns>
                                     <asp:TemplateField  ItemStyle-Width="30">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <input type="hidden" name="id" value='<%# Eval("RId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:admin_language, article_add_img %>" ItemStyle-CssClass="resim" HeaderStyle-CssClass="resim">
                                        <ItemTemplate>
                                            <asp:Image ID="ImgResim" ImageUrl='<%# Eval("Resim", "{0}") %>'
                                                runat="server" Style="max-height: 50px; margin: 0 auto;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="satir" />
                                    <AlternatingRowStyle CssClass="aSatir" />
                                    <EditRowStyle CssClass="eSatir" />
                                    <SelectedRowStyle CssClass="seciliSatir" />
                                    <HeaderStyle CssClass="baslikSatir" />
                                    <SortedAscendingHeaderStyle CssClass="artan" />
                                    <SortedDescendingHeaderStyle CssClass="azalan" />
                                    <SortedAscendingCellStyle CssClass="artan" />
                                    <SortedDescendingCellStyle CssClass="azalan" />
                                </asp:GridView>
                            </div>
                       </div>
                       <div class="modal-footer">
                          <asp:LinkButton  runat="server" ID="lnkBtnKaydet" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet"  OnClick="lnkBtnKaydet_Click"></asp:LinkButton>
                      </div>
                  </div>
           </div>
       </div>
</asp:Content>
