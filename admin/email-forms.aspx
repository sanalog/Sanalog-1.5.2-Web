<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="email-forms.aspx.cs" Inherits="admin_varsayilan_epostalar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

                        $('body').on("click", ".table tr", function (e) {
                if (e.target.tagName == "TD") {
                    $("input[rel=Sec]").prop('checked', false);
                    $(this).closest('tr').find('input[rel=Sec]').prop('checked', 'checked');
                    $('.icon_duzenle').click();
                }
            });

            $('body').on("click", ".icon_sil", function () {
                if ($('input[rel=Sec]:checked').length < 1) {
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                    return;
                }

                bootbox.confirm("Silmek istediğinizden emin misiniz?", function (result) {
                    if (result != true)
                        return;

                    $('[name=HdnSil]').val('');
                    $('input[rel=Sec]:checked').each(function () {
                        $('[name=HdnSil]').val($('[name=HdnSil]').val() + $(this).val() + ',');
                    });
                    $('[name=HdnSil]').val($('[name=HdnSil]').val().substring(0, $('[name=HdnSil]').val().length - 1));
                    $('form').submit();
                });
            });

            $('body').on("change", "input[rel=TSec]", function () {
                $("input[rel=Sec]").prop('checked', $(this).is(':checked'));
            });

            $('body').on("click", ".icon_duzenle", function () {
                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else
                    window.location.href = "email-forms-edit.aspx?epid=" + $('input[rel=Sec]:checked:first').val();
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">

    <div class="row haberler">
        <div class="col-md-12">


<div class="page-head-x4"><%= Resources.admin_language.email_forms_title %></div>
      <div class="page-head-x1"><%= Resources.admin_language.email_forms_help %></div>
      
            
           <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
        <div class="col-md-12">

             
            <a href="javascript:;" class="btn btn-info icon_duzenle"> <%= Resources.admin_language.edit %> </a> 
            <a href="javascript:;" class="btn btn-danger icon_sil"> <%= Resources.admin_language.delete %></a>
            <a href="email-forms-edit.aspx" class="btn btn-success icon_yeni"> <%= Resources.admin_language.add_new %> </a>

        </div>
</div> 
    

        
            <div id="global_errors" class="errors-out">
        <div class="errors-in"></div>
      </div>

 <div class="panel">
            <div class="panel-heading"><%= Resources.admin_language.email_forms_list %></div>
            <div class="panel-body">

    
            <asp:GridView ID="GV" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SDS"
                GridLines="None" AllowPaging="True" AllowSorting="True"
                PageSize="20" OnDataBound="GV_DataBound">
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                        <HeaderTemplate>
                            <input rel="TSec" type="checkbox" title="Tümünü seç" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <input rel="Sec" type="checkbox" value="<%# Eval("EPId") %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Anahtar" HeaderText="<%$ Resources:admin_language,key %>"  ReadOnly="True" />
                    <asp:BoundField DataField="Aciklama" HeaderText="<%$ Resources:admin_language,description %>"  ReadOnly="True" />
                </Columns>
                                <PagerTemplate>
                                    <nav>
                                        <ul class="pagination" >
                                            <li><asp:LinkButton runat="server" ID="IlkPage" CommandName="First" aria-hidden="true" >&laquo;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="geri" CommandName="Prev"   aria-hidden="true" >&#8249;</asp:LinkButton> </li>
                                            <asp:PlaceHolder ID="Sayfalama" runat="server" />
                                            <li><asp:LinkButton runat="server" ID="ileri"  CommandName="Next" aria-hidden="true" >&#8250;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="SonPage" CommandName="Last"   aria-hidden="true" >&raquo;</asp:LinkButton></li>
                                        </ul>
                                  </nav>
                                </PagerTemplate>
                <RowStyle CssClass="satir" />
                <AlternatingRowStyle CssClass="aSatir" />
                <EditRowStyle CssClass="eSatir" />
                <SelectedRowStyle CssClass="seciliSatir" />
                
                <HeaderStyle CssClass="baslikSatir" />
            </asp:GridView>
       
 </div>
    </div>

        </div>
    </div>
    <input type="hidden" name="HdnSil" />
    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT EPId, Anahtar, Aciklama FROM snlg_V1.TblEPostaSablon  ORDER BY Anahtar">
        <SelectParameters>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
