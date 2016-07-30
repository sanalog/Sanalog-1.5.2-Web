<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/product-edit.aspx.cs" Inherits="admin_urunduzenle" %>

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
    <div class="row urunDuzenle">
        <div class="col-md-12">

            <asp:FormView ID="FVDetay" runat="server" DataKeyNames="UrunId" DataSourceID="SdsUrun"
                DefaultMode="Edit" OnDataBound="FVDetay_DataBound">
                <InsertItemTemplate>

                    <div class="page-head-x4"><%= Resources.admin_language.products_add_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.products_add_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Insert" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet"></asp:LinkButton>
                            <a href="products.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>
                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.products_add_form %></div>
                        <div class="panel-body">
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBUrunAd" CssClass="form-control" runat="server" Text='<%# Bind("UrunAd") %>' MaxLength="250" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TBUrunAd" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_url %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_code %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBKod" CssClass="form-control" runat="server" Text='<%# Bind("UrunKodu") %>' MaxLength="50" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_small_content %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="750" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.proudct_ImageInfo %></label>
                                <div class="col-md-6">
                                    <div class="alert alert-warning">
                                        <%= Resources.admin_language.proudct_image %>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_view_cat %></label>
                                <div class="col-md-6">
                                    <asp:ListBox ID="ListKtg" CssClass="form-control list long" runat="server" Rows="8" SelectionMode="Multiple"></asp:ListBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ListKtg" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_detail %></label>
                                <div class="col-md-6">
                                    <div class="ckEditor">
                                        <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                            CssClass="CKEditor" Text='<%# Bind("Detay") %>'> </CKEditor:CKEditorControl>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_row %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TBSira" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language, products_row_error %>" MaximumValue="30000" MinimumValue="0"
                                        Type="Integer" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_price %></label>
                                <div class="col-md-6">
                                    <p>
                                        <asp:TextBox ID="TbFiyat" CssClass="form-control" runat="server" Text='<%# Bind("Fiyat") %>' MaxLength="15" />
                                    </p>
                                    <asp:DropDownList ID="DDL1" runat="server" DataSourceID="SDSPara" DataTextField="Para"
                                        DataValueField="PId" SelectedValue='<%# Bind("PId") %>'>
                                    </asp:DropDownList>
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TbFiyat" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language, products_price_error %>" MaximumValue="9999999" MinimumValue="0"
                                        Type="Currency" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
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
                    </div>
                </InsertItemTemplate>

                <EditItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.products_edit_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.products_edit_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Update" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet"> </asp:LinkButton>
                            <asp:LinkButton CommandName="Update" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language, save_new %>" class="btn btn-success icon_kaydetyeniac"></asp:LinkButton>
                            <asp:LinkButton CommandName="delete" runat="server" Text="<%$ Resources:admin_language,delete %>" title="Bu dildeki içeriği sil" class="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                            <a href="products.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading">Ürün Düzenleme Formu</div>
                        <div class="panel-body">
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                <div class="col-md-6"><%# DilleriListele(Eval("Diller")) %> </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBUrunAd" CssClass="form-control" runat="server" Text='<%# Bind("UrunAd") %>' MaxLength="500" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TBUrunAd" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_url %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBUrl" CssClass="form-control" runat="server" Text='<%# Bind("SeoUrl") %>' MaxLength="250" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_code %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBKod" CssClass="form-control" runat="server" Text='<%# Bind("UrunKodu") %>' MaxLength="50" />
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_small_content %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="750" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" /></span>
                                </div>
                            </div>


                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.proudct_ImageInfo%></label>
                                <div class="col-md-6">
                                    <asp:Repeater runat="server" ID="rpResimler">
                                        <ItemTemplate>
                                            <asp:Image ID="ImgResim" ImageUrl='<%# Eval("Resim", "{0}") %>'
                                                runat="server" Style="max-height: 50px; margin: 0 auto;" />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <a href='<%# Eval("UrunID", "product-photos.aspx?uid={0}") %>' class="btn btn-success icon_resimEkle"><%= Resources.admin_language.article_add_image %></a>
                                </div>
                            </div>


                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_view %></label>
                                <div class="col-md-6">
                                    <asp:ListBox ID="ListKtg" CssClass="form-control" runat="server" Rows="8" SelectionMode="Multiple"></asp:ListBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListKtg" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_detail %></label>
                                <div class="col-md-6">
                                    <div class="sayfaIcerik">
                                        <div class="ckEditor">
                                            <CKEditor:CKEditorControl ID="CKE1" runat="server" BasePath="/plugins/ckeditor/"
                                                CssClass="CKEditor" Text='<%# Bind("Detay") %>'> </CKEditor:CKEditorControl>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_row %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                    <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="TBSira" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language, products_row_error %>" MaximumValue="30000" MinimumValue="0"
                                        Type="Integer" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.products_price %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TbFiyat" CssClass="form-control" runat="server" Text='<%# Bind("Fiyat") %>' MaxLength="15" />
                                    <asp:DropDownList ID="DDL1" runat="server" DataSourceID="SDSPara" DataTextField="Para"
                                        DataValueField="PId" SelectedValue='<%# Bind("PId") %>'>
                                    </asp:DropDownList>
                                    <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="TbFiyat" CssClass="hata" Display="Dynamic"
                                        ErrorMessage="<%$ Resources:admin_language, products_price_error %>" MaximumValue="9999999" MinimumValue="0"
                                        Type="Currency" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
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
                    </div>


                </EditItemTemplate>


            </asp:FormView>

        </div>
    </div>

    <asp:SqlDataSource ID="SdsUrun" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_UrunEkle" InsertCommandType="StoredProcedure" SelectCommand="snlg_V1.msp_UrunDetaySec"
        SelectCommandType="StoredProcedure" OnInserted="SdsUrun_Inserted" UpdateCommand="snlg_V1.msp_UrunDuzenle"
        UpdateCommandType="StoredProcedure" OnUpdated="SdsUrun_Updated" OnInserting="SdsUrun_Inserting"
        OnUpdating="SdsUrun_Updating" DeleteCommand="DELETE FROM snlg_V1.TblUrunDetay FROM snlg_V1.TblUrunDetay INNER JOIN snlg_V1.TblUrunApp ON snlg_V1.TblUrunDetay.UrunId = snlg_V1.TblUrunApp.UrunId WHERE (snlg_V1.TblUrunApp.UrunId = @UrunId) AND (snlg_V1.TblUrunDetay.Dil = @Dil)"
        OnDeleted="SdsUrun_Deleted" OnDeleting="SdsUrun_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="UrunId" QueryStringField="uid" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="UrunId" QueryStringField="uid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="UrunId" QueryStringField="uid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="KtgSql" Type="String" />
            <asp:Parameter Name="Sira" Type="Int16" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="UrunAd" Type="String" />
            <asp:Parameter Name="Detay" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
            <asp:Parameter Name="Fiyat" Type="Decimal" />
            <asp:Parameter Name="PId" Type="Byte" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="KtgSql" Type="String" />
            <asp:Parameter Name="Sira" Type="Int16" />
            <asp:Parameter Name="Gorunurluk" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="UrunAd" Type="String" />
            <asp:Parameter Name="Detay" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
            <asp:Parameter Name="Fiyat" Type="Decimal" />
            <asp:Parameter Name="PId" Type="Byte" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="AramaIndex" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSPara" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT PId, Simge + ' (' + Para + ')' AS Para FROM snlg_V1.TblParaBirimleri"></asp:SqlDataSource>
</asp:Content>
