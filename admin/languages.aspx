<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="languages.aspx.cs" Inherits="admin_dil_tanimla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row dilTanimla">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.languages_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.languages_title_help %></div>


            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">


                    <asp:LinkButton ID="ImageButton1" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet" OnClick="ImgKaydet_Click"></asp:LinkButton>

                </div>
            </div>



            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>




            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.languages_select %></div>
                <div class="panel-body">


                    <table class="table table-bordered table-striped">
                        <tr class="satir">
                            <td class="secim">
                                <input type="checkbox" name="CBDil" value='<%# Eval("DId") %>' checked="checked"
                                    disabled="disabled" />
                            </td>
                            <td class="bayrak">
                                <img src="/admin/common/images/flags/<%= Snlg_ConfigValues.defaultLangId %>.png" />
                            </td>
                            <td class="dil"><%= Resources.admin_language.languages_tr %>
                            </td>
                        </tr>
                        <asp:Repeater runat="server" DataSourceID="SDSDil">
                            <ItemTemplate>
                                <tr class="aSatir">
                                    <td class="secim">
                                        <input type="checkbox" name="CBDil" value='<%# Eval("DId") %>' <%# Convert.ToBoolean(Eval("Aktif")) ? "checked" : "" %> />
                                    </td>
                                    <td class="bayrak">
                                        <img src="<%# Eval("DId","/admin/common/images/flags/{0}.png") %>" />
                                    </td>
                                    <td class="dil">
                                        <%# Eval("Dil") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr class="satir">
                                    <td class="secim">
                                        <input type="checkbox" name="CBDil" value='<%# Eval("DId") %>' <%# Convert.ToBoolean(Eval("Aktif")) ? "checked" : "" %> />
                                    </td>
                                    <td class="bayrak">
                                        <img src="<%# Eval("DId","/admin/common/images/flags/{0}.png") %>" />
                                    </td>
                                    <td class="dil">
                                        <%# Eval("Dil") %>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                        </asp:Repeater>
                    </table>

                </div>
            </div>

        </div>
    </div>
    <asp:SqlDataSource ID="SDSdil" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT TD.DId, TD.Name + '(' + TD.LongName + ')' AS Dil, Aktif FROM snlg_V1.TblDiller TD WHERE DId <> @DefaultLang ORDER BY Aktif DESC, TD.Name">
        <SelectParameters>
            <snlg:ApplicationParameter Name="DefaultLang" AppKeyName="DefaultLangId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
