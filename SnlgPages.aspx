<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SnlgPages.aspx.cs" Inherits="SnlgPage_aspx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <link rel="SHORTCUT ICON" href="/uploads/images/favicon.ico" />
    <link rel="canonical" href="http://www.sanalog.org/" />
    <meta content="After 1 days" name="Revisit" />
    <meta content="all" name="audience" />
    <link rel="author" href="https://www.facebook.com/Sanalog/" title="Sanalog.org on Facebook" />
    <meta name="author" content="Sanalog v1.5" />
    <meta name="Robots" content="index,follow" />
    <meta name="googlebot" content="index,follow" />
    <meta name="yandexbot" content="index, follow" />
    <meta name="bingbot" content="index, follow" />
    <meta name="YandexImages" content="index, follow" />
    <meta name="YandexMedia" content="index, follow" />
    <meta name="YandexBlogs" content="index, follow" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
           <script type="text/javascript" src="/themes/default/js/html5shiv.min.js"></script>
           <script type="text/javascript" src="/themes/default/js/respond.min.js"></script>
        <![endif]-->

    <link href='//fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <%--Admin kısmı ile interface kısmını etkilediğinden silinmemelidir.--%>
    <style>
        .save-button {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" novalidate>
        <%--bu div şablon dizaynı yapılırken kullanılıyor--%>
        <div class="save-button">
            <asp:LinkButton CssClass="btn btn-success" runat="server" ID="BtnKaydet"><i class="fa fa-floppy-o"></i>&nbsp;Tasarımı Kaydet</asp:LinkButton>
            <a class="btn btn-default" target="_top" href="/admin/templates.aspx"><i class="fa fa-times-circle"></i>&nbsp;Kapat</a>
        </div>

        <div id="designControls" runat="server" class="boxes" visible="false">
            <div class="columnMain box" runat="server" ondrop="onDrop(event)" ondragover="isAllowDrop(event)" id="designControlsBox">
                <%--dizayn kısmına direk girmeye çalışırsa admine postalasın--%>
                <%--            <script type="text/javascript">if (top.location.href.indexOf("/admin/templates.aspx") < 0) top.location.href = "/admin/templates.aspx";</script>--%>
                <div class="errors-out">
                    <div class="errors-in"></div>
                </div>
                <div class="form-group-no-border blok-search">
                    <input type="text" placeholder="Hızlı Arama" class="form-control" />
                </div>

            </div>
            <br />
            <br />
            <%--bu hidden'ler dizilen kontrolelrin sıralamasını tutuyor--%>
            <input type="hidden" name="HdnContainers" value="" />
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#designControls").addClass("col-sm-3");
                    $("#snlgViewPage").addClass("col-sm-9");
                    BlokDizaynYaz();

                    $("body").on("keyup", '.blok-search input', function () {
                        $('#designControls [draggable]').show();
                        var valThis = $(this).val().toLowerCase();
                        if (valThis != "") {
                            $('#designControls [draggable]').each(function () {
                                var text = $(this).find(".box-title>h4").text().toLowerCase();
                                if (text.indexOf(valThis) < 0) {
                                    $(this).hide();
                                }
                            });
                        }
                    });
                });

                function isAllowDrop(ev) {
                    ev.preventDefault();
                }

                function onDragStart(ev) {
                    ev.dataTransfer.setData("Text", ev.target.id);
                }

                function onDrop(ev) {
                    ev.preventDefault();
                    var draggedCustomer = document.getElementById(ev.dataTransfer.getData("Text"));

                    if ($(ev.target).closest("[draggable]").length > 0) {
                        $(ev.target).closest("[draggable]").before($(draggedCustomer));
                    }
                    else if ($(ev.target).hasClass("columnMain")) {
                        $(ev.target).closest("div.columnMain").append($(draggedCustomer));
                    }
                }

                function BlokDizaynYaz() {
                    var xmlControls = '<containers>';
                    $('[ondrop]').each(function () {
                        xmlControls += "<container id='" + $(this).attr("id").replace("C-", "") + "'>";
                        $(this).find('[draggable=true]').each(function () {
                            xmlControls += "<uc bpid='" + $(this).attr("data-blockPlaceid") + "' ucid='" + $(this).attr("data-ucid") + "'>";
                            $(this).find('select').each(function () {
                                xmlControls += "<attr attrid='" + $(this).attr("data-attr-id") + "' value=\"" + $(this).val() + "\"/>";
                            });
                            xmlControls += "</uc>";
                        });
                        xmlControls += "</container>";
                    });
                    xmlControls += '</containers>';

                    $('input[name="HdnContainers"]').val(xmlControls);
                }

                $(document).ready(function () {
                    $('div[draggable=true] .closeBlok').click(function () {
                        $('#designControlsBox div[draggable=true]:last').after($(this).closest("div[draggable=true]"));
                    });
                    $('div[draggable=true] .collapse').click(function () {
                        $(this).closest("div").next("div").toggle();
                        $(this).find("i").toggleClass("fa-chevron-down");
                        $(this).find("i").toggleClass("fa-chevron-up");
                    });
                    //kaydet butona tıklandığında blok dizilimini yaz
                    $("#BtnKaydet").click(function () {
                        BlokDizaynYaz();
                    });
                });
            </script>

        </div>
        <div id="snlgViewPage">
            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>
            <div id="Design">
                <div id="Design-in">
                    <!---->
                    <nav class="navbar navbar-top" runat="server">
                        <div class="container">

                            <div class="row">
                                <div class="col-md-4">

                                    <asp:PlaceHolder runat="server" ID="snlg_PH1" />

                                </div>
                                <div class="col-md-8">

                                    <asp:PlaceHolder runat="server" ID="snlg_PH2" />

                                </div>
                            </div>
                        </div>
                    </nav>
                    <!---->

                    <nav class="navbar navbar-fixed-top navbar" runat="server">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:PlaceHolder runat="server" ID="snlg_PH5" />
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>

                                    <asp:PlaceHolder runat="server" ID="snlg_PH6" />

                                </div>
                            </div>
                        </div>
                    </nav>
                </div>

                <div class="page-title" runat="server">
                    <div class="container">
                        <div class="pull-left">
                            <asp:PlaceHolder runat="server" ID="snlg_PH33" />
                        </div>
                        <div class="pull-right">
                            <asp:PlaceHolder runat="server" ID="snlg_PH34" />
                        </div>
                    </div>
                </div>
                <!---->
                <asp:PlaceHolder runat="server" ID="snlg_PH35" />
                <!---->

                <div class="content container" runat="server">

                    <div class="row">
                        <div runat="server" class="col-md-12">
                            <asp:PlaceHolder runat="server" ID="snlg_PH9" />
                        </div>
                    </div>
                </div>
                <!---->
                <div class="content container" runat="server">

                    <div class="row">
                        <div class="col-md-4">

                            <asp:PlaceHolder runat="server" ID="snlg_PH8" />

                        </div>
                        <div class="col-md-4">

                            <asp:PlaceHolder runat="server" ID="snlg_PH3" />

                        </div>
                        <div class="col-md-4">

                            <asp:PlaceHolder runat="server" ID="snlg_PH4" />

                        </div>
                    </div>
                </div>
                <!---->
                <div class="content container" runat="server">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:PlaceHolder runat="server" ID="snlg_PH30" />
                        </div>
                        <div class="col-md-6">
                            <asp:PlaceHolder runat="server" ID="snlg_PH31" />
                        </div>
                    </div>
                </div>
                <!---->
                <div class="container" runat="server">

                    <div class="row main">
                        <div class="col-md-2">

                            <asp:PlaceHolder runat="server" ID="snlg_PH10" />

                        </div>
                        <div class="col-md-2">

                            <asp:PlaceHolder runat="server" ID="snlg_PH11" />

                        </div>
                        <div class="col-md-2">

                            <asp:PlaceHolder runat="server" ID="snlg_PH12" />

                        </div>
                        <div class="col-md-2">

                            <asp:PlaceHolder runat="server" ID="snlg_PH13" />

                        </div>
                        <div class="col-md-2">

                            <asp:PlaceHolder runat="server" ID="snlg_PH14" />

                        </div>
                        <div class="col-md-2">

                            <asp:PlaceHolder runat="server" ID="snlg_PH29" />

                        </div>
                    </div>
                </div>
                <!---->
                <div class="content container" runat="server">
                    <div class="main2">

                        <div class="row">
                            <div class="col-md-3">

                                <asp:PlaceHolder runat="server" ID="snlg_PH27" />

                            </div>
                            <div class="col-md-9">

                                <asp:PlaceHolder runat="server" ID="snlg_PH28" />

                            </div>
                        </div>
                    </div>
                </div>
                <!---->
                <div class="content container" runat="server">
                    <div class="row">
                        <div class="col-md-9">

                            <asp:PlaceHolder runat="server" ID="snlg_PH15" />

                        </div>
                        <div class="col-md-3">

                            <asp:PlaceHolder runat="server" ID="snlg_PH16" />

                        </div>
                    </div>
                </div>
                <!---->
                <div class="content container" runat="server">

                    <div class="row">
                        <div class="col-md-4">

                            <asp:PlaceHolder runat="server" ID="snlg_PH17" />

                        </div>
                        <div class="col-md-8">

                            <asp:PlaceHolder runat="server" ID="snlg_PH18" />

                        </div>
                    </div>
                </div>
                <!---->
                <div class="container" runat="server">
                    <div class="row">
                        <div class="col-md-3">

                            <asp:PlaceHolder runat="server" ID="PlaceHolder3" />

                        </div>
                        <div class="col-md-3">

                            <asp:PlaceHolder runat="server" ID="PlaceHolder4" />

                        </div>

                    </div>
                </div>
                <!---->
                <div class="container" runat="server">

                    <div class="row">
                        <div class="col-md-12">

                            <asp:PlaceHolder runat="server" ID="snlg_PH21" />

                        </div>
                    </div>
                </div>


                <!---->
                <footer class="footer" runat="server">
                    <div class="container">

                        <div class="row">
                            <div class="col-sm-2">

                                <asp:PlaceHolder runat="server" ID="snlg_PH22" />

                            </div>
                            <div class="col-sm-5">

                                <asp:PlaceHolder runat="server" ID="snlg_PH23" />

                            </div>
                            <div class="col-sm-3">

                                <asp:PlaceHolder runat="server" ID="snlg_PH36" />

                            </div>

                            <div class="col-sm-2">

                                <asp:PlaceHolder runat="server" ID="snlg_PH26" />

                            </div>


                        </div>
                    </div>

                </footer>

                <!---->
            </div>
        </div>


    </form>
    <%--Carousel item active forrepeater--%>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {


            $(".carousel-inner").each(function () {
                $(this).find(".item:first").addClass("active");
            });

            try {//top menü
                //önce alt menüleri gizle
                $("ul.dropdown-menu ul.dropdown-menu").hide();
                //menülerin üzerine gelince göster gizle
                $(".snlg-block-menu-top li.dropdown").hover(
                    function () {
                        $(this).find(" > ul.dropdown-menu").show();
                        $(this).find(" > ul.dropdown-menu")
                            .not($(".snlg-block-menu-top > ul > li > ul.dropdown-menu"))
                            .css("margin-left", $(this).css("width"))
                            .css("top", "0");
                    },
                    function () { $("ul.dropdown-menu ul.dropdown-menu").not($(this).parents("ul")).hide(); });
            } catch (e) { }


            //left ve right menü ve diğer menüler için show hide
            $("[data-snlg='menu'] ul").hide();
            $("[data-snlg='menu'] a, [data-snlg='menu'] a").click(function () {
                if ($(this).data("status") == "show") {
                    $(this).data("status", "hide");
                    $(this).next("i").next("ul").hide(100);
                }
                else {
                    $(this).data("status", "show");
                    $(this).next("i").next("ul").show(100);
                }
            });

            if ($("[data-snlg='menu'] ul a[href='<%= Request.RawUrl + Snlg_ConfigValues.urlExtension %>']").length > 0)
                $("[data-snlg='menu'] ul a[href='<%= Request.RawUrl + Snlg_ConfigValues.urlExtension %>']").parents("ul").show();
            else {
                $("[data-snlg='menu']").each(function () {
                    $(this).find("li:first a:first").data("status", "show");
                    $(this).find("li:first ul:first").show(100);
                });
            }

            $("body").on("click", '.ttErrorBox', function () {
                $(this).remove();
            });

        });
    </script>
</body>

<asp:literal runat="server" id="LtrScriptFile"></asp:literal>
<asp:literal runat="server" id="LtrScript"></asp:literal>
</html>

