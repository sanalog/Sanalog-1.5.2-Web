<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="language-edit.aspx.cs" Inherits="admin_dil_duzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row dilDuzenle">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.languages_edit_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.languages_edit_title_help %></div>


            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">


                    <asp:LinkButton ID="ImgKaydet" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet" OnClick="ImgKaydet_Click" Visible="false"></asp:LinkButton>

                </div>
            </div>



            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>



            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.languages_edit_select %></div>
                <div class="panel-body">

                    <div class="row form-group no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.languages_edit_slct %></label>
                        <div class="col-md-6">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDSDil">
                                <ItemTemplate>
                                    <a href="<%# Eval("DId", "?dil={0}") %>" class='<%# Eval("DId").ToString() == Request.QueryString["dil"] ? "current" : "" %>'>
                                        <img src="<%# Eval("DId","/admin/common/images/flags/{0}.png") %>" alt='<%# Eval("Dil") %>'
                                            title='<%# Eval("Dil", "{0} düzenle") %>' /></a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                </div>

            </div>



            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.languages_edit_content %></div>
                <div class="panel-body">


                    <asp:GridView ID="Grid" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="name" HeaderText="<%$ Resources:admin_language,lang_exs %>" ItemStyle-CssClass="ifade" HeaderStyle-CssClass="ifade" />
                            <asp:BoundField DataField="value" HeaderText="<%$ Resources:admin_language,lang_org_value %>" ItemStyle-CssClass="deger" />
                            <asp:TemplateField ItemStyle-CssClass="deger2">
                                <HeaderTemplate>
                                    Yeni Değer
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input type="text" class="form-control" name="<%# Eval("name", "v_{0}") %>" value="<%# Eval("yeniDeger") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="comment" HeaderText="<%$ Resources:admin_language,description %>" ItemStyle-CssClass="aciklama" />
                        </Columns>
                        <RowStyle CssClass="satir" />
                        <AlternatingRowStyle CssClass="aSatir" />
                        <HeaderStyle CssClass="baslikSatir" />
                    </asp:GridView>

                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SDSdil" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT DId, Name + '(' + LongName + ')' AS Dil FROM snlg_V1.TblDiller WHERE Aktif = 1 ORDER BY Name">
        <SelectParameters>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
