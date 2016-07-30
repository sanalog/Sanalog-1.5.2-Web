<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="template-pages-transfer.aspx.cs" Inherits="admin_sablondaki_sayfalari_tasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row sablonSayfaTasi">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.temp_page_trans_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.temp_page_trans_help %></div>
            
            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <asp:LinkButton ID="BtnTasi" runat="server" OnClick="BtnTasi_Click" class="btn btn-info"><i class="fa fa-share"> </i> <%= Resources.admin_language.temp_page_transfer %></asp:LinkButton>
                </div>
            </div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>


            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.place_holder_list %></div>
                <div class="panel-body">

                    <div class="row form-group no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.temp_source %></label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DDLFrom" class="form-control" runat="server" DataSourceID="SdsSablon" DataTextField="SablonAd"
                                DataValueField="SablonId">
                            </asp:DropDownList>

                        </div>
                    </div>

                    <div class="row form-group no-gutter">
                        <label class="col-md-6"><%= Resources.admin_language.temp_target %></label>
                        <div class="col-md-6">

                            <asp:DropDownList ID="DDLTo" class="form-control" runat="server" DataSourceID="SdsSablon" DataTextField="SablonAd"
                                DataValueField="SablonId">
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>


    <asp:SqlDataSource ID="SdsSablon" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT SablonId, SablonAd FROM snlg_V1.TblDesignSablonlar">
        <SelectParameters>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
