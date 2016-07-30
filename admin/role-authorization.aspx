<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="role-authorization.aspx.cs" Inherits="admin_rol_yetki" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('body').on("change", "input[rel=TSec]", function () {
                $(this).closest("table").find(":checkbox").not(this).prop('checked', $(this).is(':checked'));
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row rolYetki">
        <div class="col-md-12">


            <div class="page-head-x4"><%= Resources.admin_language.roles_edit_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.roles_edit_help %></div>


            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <asp:LinkButton runat="server" class="btn btn-info icon_kaydet" Text="<%$ Resources:admin_language, save %>" OnClick="ImgKaydet_Click"></asp:LinkButton>
                    <a href="roles.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %> </a>
                </div>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>


            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.role_edit_auth %></div>
                <div class="panel-body">

                    <asp:GridView ID="GVYetki" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SDS" GridLines="None" DataKeyNames="YetkiId">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CB" runat="server" Checked='<%# Eval("Secili") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Yetki" ItemStyle-CssClass="yetki" />
                            <asp:BoundField DataField="YetkiTanim" HeaderText="<%$ Resources:admin_language, role_edit_name %>" ItemStyle-CssClass="yetki" />
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
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_Rol_Yetkiler" SelectCommandType="StoredProcedure">
        <SelectParameters>

            <asp:QueryStringParameter Name="RolId" Type="Int16" QueryStringField="rid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <input type="hidden" name="HdnSil" />
</asp:Content>
