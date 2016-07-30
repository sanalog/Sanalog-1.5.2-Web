<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="product-photos.aspx.cs" Inherits="admin_urun_resimleri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

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


        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="resimGalerileri">

        <div class="page-head-x4"><%= Resources.admin_language.products_photo_title %></div>
        <div class="page-head-x1"><%= Resources.admin_language.products_photo__help %></div>

        <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
            <div class="col-md-12">

                <a href="javascript:;" class="btn btn-warning icon_order" onclick="SnlgGdvSiralama();"><%= Resources.admin_language.icon_sorting %></a>
                <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.delete %></a>
                 <asp:HiddenField ID="HdnImg" runat="server" />

                <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=HdnImg.ClientID %>');  "><%= Resources.admin_language.products_photo_add %></a>

<%--                <a class="btn btn-success btn-sm fileinput-button icon_yeni" onclick="BrowseServer('Images:/', $(this).prevAll('[type=hidden]:first').attr('id'));"><%= Resources.admin_language.products_photo_add %></a>--%>
               
                 <asp:Button ID="BtnSaveImage" runat="server" CssClass="btnFMSave"  OnClick="BtnSaveImage_Click" style="display:none;" />
                <a href="products.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.announce_add_close %></a>
            </div>

        </div>
        <div id="global_errors" class="errors-out">
            <div class="errors-in">
            </div>
        </div>
        <div class="page-head-x4">
            <asp:Label runat="server" ID="LblUrunAdi"></asp:Label>
            <%= Resources.admin_language.products_off_photo %>
        </div>
        <div class="panel">
            <div class="panel-body">

                <asp:GridView ID="GVResim" runat="server" AutoGenerateColumns="False" DataKeyNames="ResimId" class="table table-bordered table-striped"
                    DataSourceID="SDSResim" GridLines="None">
                    <Columns>
                        <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                            <HeaderTemplate>
                                <input rel="TSec" type="checkbox" title="Tümünü seç" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input rel="Sec" type="checkbox" value="<%# Eval("ResimId") %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkDefault" runat="server" data='<%# Eval("DefaultResim").ToString() + Eval("Resim").ToString() %>' CssClass='<%# Eval("DefaultResim").ToString().Equals(Eval("Resim").ToString()) ? "btn btn-success icon_default" : "btn btn-warning icon_default" %>'
                                    OnCommand="LinkDefault_Command"  CommandArgument='<%# Eval("ResimId") %>'><%= Resources.admin_language.product_vitrin %></asp:LinkButton>
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
                    <HeaderStyle CssClass="baslikSatir" />
                </asp:GridView>
            </div>
        </div>


        <asp:SqlDataSource ID="SDSResim" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
            SelectCommand="SELECT UR.UrunId, UR.Sira, UR.Resim, UR.ResimId, U.Resim AS DefaultResim FROM snlg_V1.TblUrunResim AS UR INNER JOIN snlg_V1.TblUrunApp AS U ON UR.UrunId = U.UrunId WHERE (UR.UrunId = @UrunId) ORDER BY UR.Sira">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="uid" Name="UrunId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <input type="hidden" name="HdnSil" />
    <input type="hidden" name="HdnDefault" />


     <div id="modalSnlgGdvSiralama" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                       <div class="modal-header">
                          <button type="button" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title" id="myModalLabel"><%= Resources.admin_language.products_photo_title %>  </h4>
                        </div>
                       <div class="modal-body" style="height:600px;">
                            <div  style="width:100%; height:100%;">
                                   <asp:GridView ID="GrdSiralama" class="gdvSirala table table-bordered table-striped" runat="server"
                                    AutoGenerateColumns="False"
                                     DataKeyNames="ResimId">
                                    <Columns>
                                     <asp:TemplateField  ItemStyle-Width="30">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <input type="hidden" name="id" value='<%# Eval("ResimId") %>' />
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
