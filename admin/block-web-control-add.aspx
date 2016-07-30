<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="block-web-control-add.aspx.cs" Inherits="admin_blok_web_control_ekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('body').on("change", "input[rel=TSec]", function () {
                $("tr input[type=checkbox]:odd").attr('checked', $(this).is(':checked'));
            });

            $('.table tbody tr').each(function () {
                var Pos1 = $(this).find('td:eq(1)').text().replace(".ascx", "").lastIndexOf('\\');
                var uzunluk = $(this).find('td:eq(1)').text().replace(".ascx", "").length;
                $(this).find('[type=text]:eq(0)').val($(this).find('td:eq(1)').text().substring(0, Pos1) + " - " + $(this).find('td:eq(1)').text().substring(Pos1 + 1, uzunluk));
            });

            $('.icon_kaydet').click(function (e) {
                var hata = false;
                $('.table tr').each(function () {
                    if ($(this).find('[type=text]').length > 0) {
                        if (hata) {
                            e.preventDefault();
                        }
                        else if ($(this).find('[type=checkbox]:first').is(':checked') && !$(this).find('[type=text]:eq(0)').val()) {
                            $(this).find('[type=text]:eq(0)').focus();
                            bootbox.alert('İşaretlediğiniz web kontroller için tanımlayıcı bir isim girmelisiniz.');
                            hata = true;
                        }
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row kontrolEkle">
        <div class="col-md-12">


            <div class="page-head-x4"><%= Resources.admin_language.web_cont_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.web_cont_help %></div>


            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <asp:LinkButton runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet" OnClick="BtnUC_Click"></asp:LinkButton>

                </div>
            </div>


            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>


            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.web_cont_list %></div>
                        <div class="panel-body">



                            <asp:GridView ID="GVUC" class="table table-bordered table-striped" runat="server" GridLines="None" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                        <HeaderTemplate>
                                            <input rel="TSec" type="checkbox" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CBSec" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Key" ReadOnly="false" ItemStyle-CssClass="key" />
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, web_cont_name_view %>" ItemStyle-CssClass="goster" HeaderStyle-CssClass="goster">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CB1" runat="server" Checked="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, web_cont_desc_name %>" ItemStyle-CssClass="isim">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TB3" CssClass="form-control" runat="server" MaxLength="100" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, web_cont_name %>" ItemStyle-CssClass="baslik">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TB1" CssClass="form-control" runat="server" MaxLength="250" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, web_cont_exp %>" ItemStyle-CssClass="aciklama">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TB2" CssClass="form-control" runat="server" MaxLength="500" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, web_cont_view %>" ItemStyle-CssClass="gorunurluk">
                                        <ItemTemplate>
                                            <div class="kontrolSelect">
                                                <asp:DropDownList ID="DDL1" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="1" Text="<%$ Resources:admin_language, all_view %>"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="<%$ Resources:admin_language, user_view %>"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="<%$ Resources:admin_language, guest_view %>"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="<%$ Resources:admin_language, pasif_view %>"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle CssClass="satir" />
                                <AlternatingRowStyle CssClass="aSatir" />
                                <EditRowStyle CssClass="eSatir" />
                                <SelectedRowStyle CssClass="seciliSatir" />
                                <PagerStyle CssClass="syfSatir" />
                                <HeaderStyle CssClass="baslikSatir" />
                            </asp:GridView>


                        </div>
                    </div>

                </div>
            </div>


        </div>
    </div>
</asp:Content>
