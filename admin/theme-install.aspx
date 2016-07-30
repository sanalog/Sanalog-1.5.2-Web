<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="theme-install.aspx.cs" Inherits="admin_theme_install" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.theme_install_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.theme_install_sub_title %></div>


            <div id="global_errors2" class="errors-out">
                <div class="errors-in"></div>
            </div>



            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.theme_install_file_upload %></div>
                <div class="panel-body">
                    <a href="javascript:;" onclick="javascript: $(this).next(':file:first').click();" class="btn btn-success btn-lg"><i class="fa fa-plus"></i><%= Resources.admin_language.theme_install_zip_upload %></a>
                    <asp:FileUpload ID="FU1" runat="server" accept=".zip" onchange="$(this).prev('a').hide();$('#divProgres').show();$(this).next('a')[0].click();" Style="display: none;" />
                    <asp:LinkButton ID="LinkZip" runat="server" OnClick="LinkZip_Click" Style="display: none;">Dosyayı Yükle</asp:LinkButton>

                    <div id="divProgres" style="display: none;">
                        <img src="/admin/common/images/progressbar.gif" />
                    </div>
                </div>

            </div>



            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.theme_install_file_list %></div>
                <div class="panel-body">

                    <div runat="server" id="divButon" visible="false">


                        <div id="global_errors" class="errors-out">
                            <div class="errors-in"></div>
                        </div>


                        <div class="theme-upload-file-list">
                            <asp:Literal ID="LtrList" runat="server" /></div>




                        <p class="mt-lg">
                            <asp:LinkButton ID="LinkOnay" OnClick="LinkOnay_Click" runat="server" class="btn btn-info btn-lg"><i class="fa fa-check" aria-hidden="true"></i> <%= Resources.admin_language.theme_install_ok %></asp:LinkButton>
                        </p>


                    </div>
                </div>
            </div>








        </div>
    </div>
</asp:Content>
