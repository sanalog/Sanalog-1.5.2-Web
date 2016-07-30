<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="template-design.aspx.cs" Inherits="admin_sablon_design" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row sablon-design">

        <div class="col-md-12">


            <div class="page-head-x4"><%= Server.UrlDecode(Request.QueryString["sAd"]) %></div>
            <div class="page-head-x1"><%= Resources.admin_language.template_desing_title %></div>
        </div>
    </div>

    <iframe class="sablon-design-iframe" id="snlgViewPageIframe" src="/SnlgPages.aspx?sablonDesignId=<%= Request.QueryString["sablonDesignId"] %>"></iframe>



</asp:Content>

