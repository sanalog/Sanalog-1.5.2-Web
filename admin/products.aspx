<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="products.aspx.cs" Inherits="admin_urunler" %>

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
                    window.location.href = "product-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&uid=" + $('input[rel=Sec]:checked:first').val();
            });

         });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnSil" />
    <cc1:ToolkitScriptManager runat="server">
    </cc1:ToolkitScriptManager>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            $('.errors-in > div').remove();
            if (document.getElementById('<%= HdnHata.ClientID %>').value != "") {
                var hata = document.getElementById('<%= HdnHata.ClientID %>').value;
                var hataTur = document.getElementById('<%= HdnHataTur.ClientID %>').value;
                $('.errors-out').css('display', 'block');
                $('.errors-in').append('<div class="' + hataTur + '">' + hata + '</div>');
                document.getElementById('<%= HdnHata.ClientID %>').value = "";
                document.getElementById('<%= HdnHataTur.ClientID %>').value = "";
            }
        }

    
    </script>
    <div class="row urunler">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.products_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.products_help %></div>


            <asp:HiddenField ID="HdnHata" runat="server" />
            <asp:HiddenField ID="HdnHataTur" runat="server" />
            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <a href="javascript:;" runat="server" id="sirala" visible="false"  class="btn btn-warning icon_order" onclick="SnlgGdvSiralama();"><%= Resources.admin_language.icon_sorting %></a>
                    <a href="javascript:;" class="btn btn-info icon_duzenle"><%= Resources.admin_language.edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.delete %></a>
                    <a href="product-edit.aspx" class="btn btn-success icon_yeni"><%= Resources.admin_language.add_new %></a>

                </div>
            </div>
            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>
            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.products_search %></div>
                <div class="panel-body">
                    <div class="row form-group no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.products_name %></label>
                        <div class="col-md-6">
                            <asp:TextBox ID="TBUA" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="row form-group no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.products_code %></label>
                        <div class="col-md-6">
                            <asp:TextBox ID="TBUK" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="row form-group no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.products_cat %></label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DDLKtg" CssClass="form-control select1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLKtg_SelectedIndexChanged1">
                                <asp:ListItem Text="<%$ Resources:admin_language, products_all %>" Value="" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row form-group-no-border no-gutter">
                        <label class="col-md-6"></label>
                        <div class="col-md-6">
                            <asp:Button ID="BtnAra" runat="server" OnClick="BtnAra_Click" Text="<%$ Resources:admin_language, search %>" CssClass="btn btn-success" />
                            <asp:Button ID="BtnAraKapat" runat="server" OnClick="BtnAraKapat_Click" Text="<%$ Resources:admin_language, search_end %>" CssClass="btn btn-danger" />
                        </div>
                    </div>


                </div>
            </div>
            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.products_list %></div>
                <div class="panel-body">
                    
                    <asp:GridView ID="GVUrun" runat="server" class="table table-bordered table-striped" AutoGenerateColumns="False" DataSourceID="SdsUrun"
                        GridLines="None" AllowPaging="True" AllowSorting="True" DataKeyNames="UrunId"
                        OnSorted="GVUrun_Sorted" OnDataBound="GVUrun_DataBound" PageSize="25">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("UrunId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:BoundField DataField="UrunAd" SortExpression="UrunAd" HeaderText="<%$ Resources:admin_language,products_name %>" ReadOnly="True"
                                ItemStyle-CssClass="baslik" HeaderStyle-CssClass="baslik" />
                                <asp:BoundField DataField="UrunKodu" SortExpression="UrunKodu" HeaderText="<%$ Resources:admin_language,products_code %>"
                                ReadOnly="True" ItemStyle-CssClass="kod" HeaderStyle-CssClass="kod" />
                         
                            <asp:TemplateField HeaderText="<%$ Resources:admin_language, article_add_img %>" ItemStyle-CssClass="resim" HeaderStyle-CssClass="resim">
                            <ItemTemplate>
                                <asp:Image ID="ImgResim" ImageUrl='<%# Eval("DefaultResim", "{0}") %>'
                                    runat="server" Style="max-height: 50px; margin: 0 auto;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Fiyat">
                               <ItemTemplate>
                                   <asp:TextBox runat="server" ID="txtFiyat"  CssClass="form-control" Text='<%# Eval("Fiyat") %>' AutoPostBack="true" OnTextChanged="txtFiyat_TextChanged"></asp:TextBox>
                                   <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtFiyat" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language, products_price_error %>" MaximumValue="9999999" MinimumValue="0"
                                        Type="Currency" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                               </ItemTemplate>
                           </asp:TemplateField>
                           
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
                        <SortedAscendingHeaderStyle CssClass="artan" />
                        <SortedDescendingHeaderStyle CssClass="azalan" />
                        <SortedAscendingCellStyle CssClass="artan" />
                        <SortedDescendingCellStyle CssClass="azalan" />
                    </asp:GridView>

                </div>
            </div>
            <asp:SqlDataSource ID="SdsUrun" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                SelectCommand="snlg_V1.msp_Urunler" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                <SelectParameters>
                    <asp:ControlParameter Name="KtgId" ControlID="DDLKtg" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>


    <div id="modalSnlgGdvSiralama" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                       <div class="modal-header">
                          <button type="button" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                           <h4 class="modal-title" id="myModalLabel"><%= Resources.admin_language.products_title %>  </h4>
                        </div>
                       <div class="modal-body" style="height:600px;">
                            <div  style="width:100%; height:100%;">
                                   <asp:GridView ID="GrdSiralama" class="gdvSirala table table-bordered table-striped" runat="server"
                                    AutoGenerateColumns="False"
                                     DataKeyNames="UrunId">
                                    <Columns>
                                     <asp:TemplateField  ItemStyle-Width="30">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                            <input type="hidden" name="id" value='<%# Eval("UrunId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:BoundField DataField="UrunKodu" SortExpression="UrunKodu" HeaderText="<%$ Resources:admin_language,products_code %>"
                                            ReadOnly="True" ItemStyle-CssClass="kod" HeaderStyle-CssClass="kod" />
                                        <asp:BoundField DataField="UrunAd" SortExpression="UrunAd" HeaderText="<%$ Resources:admin_language,products_name %>" ReadOnly="True"
                                            ItemStyle-CssClass="baslik" HeaderStyle-CssClass="baslik" />
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
