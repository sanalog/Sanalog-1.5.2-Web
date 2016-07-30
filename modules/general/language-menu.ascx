<%@ Control Language="C#" AutoEventWireup="true" CodeFile="language-menu.ascx.cs"
    Inherits="modules_diger_dil_degistir" %>

<ul class="nav navbar-nav nav-lang pull-right">
    <li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-globe"></i></a>
        <ul class="dropdown-menu">
            <asp:Repeater runat="server" DataSourceID="SDS" OnItemCommand="Unnamed1_ItemCommand">
                <ItemTemplate>
                    <li>
                        <asp:LinkButton ID="linkLang" runat="server" Text='<%# Eval("Name") %>'
                            CommandArgument='<%# Eval("Name") %>'></asp:LinkButton>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </li>
</ul>

<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_DilListele" SelectCommandType="StoredProcedure" OnSelected="SDS_Selected"></asp:SqlDataSource>
