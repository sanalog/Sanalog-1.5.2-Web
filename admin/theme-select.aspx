<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="theme-select.aspx.cs" Inherits="admin_sablondaki_sayfalari_tasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row sablonSayfaTasi">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.theme_select_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.theme_select_help %></div>
            
            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <asp:LinkButton ID="BtnTasi" runat="server" OnClick="BtnTasi_Click" class="btn btn-info"><i class="fa fa-floppy-o"> </i> <%= Resources.admin_language.theme_select_save %></asp:LinkButton>
                </div>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>


            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.theme_select_title %></div>
                <div class="panel-body">

                    <div class="row form-group no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.theme_select_themes %></label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="RBLTheme" class="form-control" runat="server">
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="row form-group no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.theme_select_themes_admin %></label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DdlAdmin" class="form-control" runat="server">
                            </asp:DropDownList>

                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>


</asp:Content>
