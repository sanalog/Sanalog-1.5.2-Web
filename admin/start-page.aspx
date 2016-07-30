<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="start-page.aspx.cs" Inherits="admin_start_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row smtpBilgileri">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.start_page_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.start_page_help %></div>
            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <asp:LinkButton ID="LinkButton1" runat="server" Text="<%$ Resources:admin_language, save %>" alt="Kaydet" title="Kaydet" class="btn btn-info icon_kaydet" OnClick="ImgKaydet_Click"></asp:LinkButton>

                </div>
            </div>
            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>
            <div class="panel">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <div class="row form-group-no-border no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.start_page_select %></label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DDLLinks" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row form-group-no-border no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.default_language_select %></label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DDLDefLang" CssClass="form-control" runat="server" DataValueField="DId" DataTextField="Name"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row form-group-no-border no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.default_language_admin %></label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DDLAdminLang" CssClass="form-control" runat="server" DataValueField="DId" DataTextField="Name"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row form-group-no-border no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.link_aspx %></label>
                        <div class="col-md-6">
                            <asp:CheckBox runat="server" ID="CBExtension" CssClass="form-control"></asp:CheckBox>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
