<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="photo-galleries.aspx.cs" Inherits="admin_resimgalerileri" %>

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
                    window.location.href = "gallery-photos.aspx?gid=" + $('input[rel=Sec]:checked:first').val();
            });

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row resimGalerileri">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.photo_gallery_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.photo_gallery_help %></div>

            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>

            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.photo_gallery_add_album %></div>
                <div class="panel-body">
                    <div class="form">
                        <asp:FormView ID="FVEkle" runat="server" DataSourceID="SdsRGal" DefaultMode="Insert">
                            <InsertItemTemplate>

                                <div class="row form-group-no-border">

                                    <div class="col-md-4">
                                        <label><%= Resources.admin_language.photo_gallery_name %></label>
                                        <asp:TextBox ID="T1" CssClass="form-control" runat="server" Text='<%# Bind("GaleriAd") %>' MaxLength="150"
                                            ValidationGroup="galekle"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="galekle" SetFocusOnError="true"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-4">
                                        <label class="label-empty"></label>
                                        <asp:LinkButton
                                            runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet" CommandName="Insert"
                                            ValidationGroup="galekle"></asp:LinkButton>
                                    </div>
                                </div>




                            </InsertItemTemplate>
                        </asp:FormView>
                    </div>
                </div>
            </div>

            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <a href="javascript:;" class="btn btn-warning  icon_duzenle"> <%= Resources.admin_language.edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"> <%= Resources.admin_language.delete %></a>
                </div>
            </div>

            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.photo_gallery_album %></div>
                <div class="panel-body">
                    <asp:GridView ID="GVGal" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="GId"
                        DataSourceID="SdsRGal" AllowPaging="True" PageSize="20" GridLines="None" OnDataBound="GVGal_DataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("GId") %>" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="GId" HeaderText="<%$ Resources:admin_language, photo_gallery_code %>" InsertVisible="False" ReadOnly="True"
                                ItemStyle-CssClass="kod" />
                            <asp:TemplateField HeaderText="<%$ Resources:admin_language, photo_gallery_name %>" ItemStyle-CssClass="isim">
                                <ItemTemplate>
                                    <asp:TextBox ID="T1" CssClass="form-control" runat="server" Text='<%# Bind("GaleriAd") %>' MaxLength="150"
                                        AutoPostBack="True" CausesValidation="True" OnTextChanged="TBGal_TextChanged"
                                        ValidationGroup="galedit"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="T1" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="*" ValidationGroup="galedit" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
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

    <asp:SqlDataSource ID="SdsRGal" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="INSERT INTO snlg_V1.TblResimGaleriApp(GaleriAd) VALUES (@GaleriAd)"
        SelectCommand="SELECT [GId], [GaleriAd] FROM snlg_V1.TblResimGaleriApp ORDER BY [GaleriAd]"
        UpdateCommand="UPDATE snlg_V1.TblResimGaleriApp SET GaleriAd = @GaleriAd WHERE (GId = @GId) " OnInserting="SdsRGal_Inserting">
        <InsertParameters>
            <asp:Parameter Name="GaleriAd" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GaleriAd" Type="String" />
            <asp:Parameter Name="GId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
