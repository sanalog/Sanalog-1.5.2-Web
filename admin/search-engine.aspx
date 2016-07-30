<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="search-engine.aspx.cs" Inherits="admin_arama_motoru" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('textarea[limit]').keyup(function (e) {
                var limit = $(this).attr('limit');
                if ($(this).val().length >= limit) {
                    if (e.keyCode != 8 && e.keyCode != 46)
                        e.preventDefault();
                    $(this).val($(this).val().substring(0, limit));
                }
                $('#' + $(this).attr('span')).text(limit - $(this).val().length);
            }).keydown(function (e) {
                var limit = $(this).attr('limit');
                if ($(this).val().length >= limit) {
                    if (e.keyCode != 8 && e.keyCode != 46)
                        e.preventDefault();
                    $(this).val($(this).val().substring(0, limit));
                }
                $('#' + $(this).attr('span')).text(limit - $(this).val().length);
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row aramaMotoru">
          <div class="col-md-12">


<div class="page-head-x4"><%= Resources.admin_language.search_engine_title %></div>
      <div class="page-head-x1"><%= Resources.admin_language.search_engine_help %></div>
      
            
           <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
        <div class="col-md-12">


            <asp:LinkButton ID="ImageButton2" runat="server" class="btn btn-info icon_kaydet" Text="<%$ Resources:admin_language, save %>" OnClick="ImgKaydet_Click" ></asp:LinkButton>

        </div>
</div> 
    

        
            <div id="global_errors" class="errors-out">
        <div class="errors-in"></div>
      </div>






<div class="panel">
            <div class="panel-heading"><%= Resources.admin_language.search_engine_form %></div>
            <div class="panel-body">
 <div class="row form-group no-gutter">
                <label class="col-md-6"><%= Resources.admin_language.search_engine_help2 %></label>
                <div class="col-md-6">
<asp:TextBox ID="TBValid" CssClass="form-control" runat="server" TextMode="MultiLine" limit="8000" span="TBValidSay" />
                                    <span class="spanlimit" id="TBValidSay" />
                </div>
              </div>

 <div class="row form-group-no-border no-gutter">
                <label class="col-md-6"><%= Resources.admin_language.search_engine_help3 %></label>
                <div class="col-md-6">
<asp:TextBox ID="TBAnly" CssClass="form-control" runat="server" TextMode="MultiLine" limit="20000" span="TBilgiSay" />
                                    <span class="spanlimit" id="TBilgiSay" />
                </div>
              </div>

       </div>
    </div>

    </div>
    </div>
</asp:Content>
