<%@ Page Title="Sanalog | Kurulum" Language="C#" MasterPageFile="~/install/MasterPage.master" AutoEventWireup="true"
    CodeFile="default.aspx.cs" Inherits="install_kurulum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHHead" runat="Server">

    <script type="text/javascript">
        $(document).ready(function () {
            //erorlar click'lenince kapansın

            $('body').on("click", ".checkbox1 :checkbox", function () {
                $("#SelectLang option").remove();
                $('.checkbox1 :checked').each(function () {
                    var dilID = $(this).val();
                    var dil = $(this).closest("li").text();
                    $("#SelectLang").append($("<option value='" + dilID + "'>" + dil + "</option>"));
                });

            });

            $('.stepOut:eq(0) .errors-out').css('display', 'block');
            //izin kontrol
            if (isvalid) {
                $('[type=button]').addClass('AjaxLooder');
                $.ajax({
                    type: "POST",
                    url: "/install/default.aspx/izinKontrol", //web service ve methodumuz
                    data: '{ }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "1") {
                            $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-success\"><i class=\"fa fa-check-square\"></i> Yazma izinleri ayarlanmış. Kuruluma devam edebilirsiniz.</div>');
                        }
                        else {
                            $('.stepOut:eq(0) :button').val('Tekrar Kontrol Et');
                            if (data.d == "2") {
                                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Kuruluma başlayabilmeniz için appSettings.config dosyası, web.config dosyası, App_GlobalResources klasörü ve uploads klasörüne yazma izni vermelisiniz.</div>');
                            }
                            else if (data.d == "3") {
                                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Kuruluma başlayabilmeniz için uploads klasörüne yazma izni vermelisiniz.</div>');
                            }
                            else if (data.d == "4") {
                                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Kuruluma başlayabilmeniz için App_GlobalResources klasörüne yazma izni vermelisiniz.</div>');
                            }
                            else if (data.d == "5") {
                                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Kuruluma başlayabilmeniz için appSettings.config dosyası ve web.config dosyası yazma izni vermelisiniz.</div>');
                            }
                        }
                    },
                    error: function () {
                        $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Talep sunucuya gönderilemiyor.</div>');
                    }
                });
            }
        });

        var isvalid = true;
        var tiklandi = false;

        function FormPost1() {
            if (tiklandi)
                return;
            else
                tiklandi = true;

            $('.errors-in > div').remove('');
            $('.errors-out').css('display', 'none');
            isvalid = true;
            $('.errors-in > div').remove('');

            if ($('.stepOut:eq(0) :checkbox:checked').length < 1) {
                $('.stepOut:eq(0) .errors-out').css('display', 'block');
                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Lütfen sözleşmeyi onaylayınız.</div>');
                isvalid = false;
            }

            if (isvalid) {
                $('[type=button]').addClass('AjaxLooder');
                $.ajax({
                    type: "POST",
                    url: "/install/default.aspx/Step1Izinler", //web service ve methodumuz
                    data: '{ }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "1") {
                            $('a[href=#tab10]')[0].click();
                            $('a[href=#tab9]').next("a").find("span").addClass("label-success").removeClass("label-warning");
                            $('a[href=#tab10]').next("a").find("span").addClass("label-warning").removeClass("label-info");
                        }
                        else {
                            $('.stepOut:eq(0) .errors-out').css('display', 'block');
                            if (data.d == "2") {
                                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Kuruluma başlayabilmeniz için appSettings.config dosyası, web.config dosyası, App_GlobalResources klasörü ve uploads klasörüne yazma izni vermelisiniz.</div>');
                            }
                            else if (data.d == "3") {
                                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Kuruluma başlayabilmeniz için uploads klasörüne yazma izni vermelisiniz.</div>');
                            }
                            else if (data.d == "4") {
                                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Kuruluma başlayabilmeniz için App_GlobalResources klasörüne yazma izni vermelisiniz.</div>');
                            }
                            else if (data.d == "5") {
                                $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Kuruluma başlayabilmeniz için appSettings.config dosyası ve web.config dosyasına yazma izni vermelisiniz.</div>');
                            }
                        }
                    },
                    error: function () {
                        $('.stepOut:eq(0) .errors-in').append('<div class=\"alert alert-danger\">Talep sunucuya gönderilemiyor.</div>');
                    }
                });
                $('[type=button]').removeClass('AjaxLooder');
            }
            tiklandi = false;
            $('[type=button]').removeAttr('disabled');
        }

        function FormPost3() {
            if (tiklandi)
                return;
            else
                tiklandi = true;

            $('.errors-in > div').remove('');
            isvalid = true;
            $('.errors-in > div').remove('');
            $('[type=button]').attr('disabled', 'disabled');

            $('.stepOut:eq(1) :text,.stepOut:eq(1) :password').each(function () {
                if (isvalid) {
                    if (!$(this).val()) {
                        $('.stepOut:eq(1) .errors-out').css('display', 'block');
                        $('.stepOut:eq(1) .errors-in').append('<div class=\"alert alert-danger\">Lütfen zorunlu alanları doldurunuz.</div>');
                        isvalid = false;
                        $(this).focus();
                    }
                }
            });

            if (isvalid) {
                $('.stepOut:eq(1) .errors-out').css('display', 'block');
                $('.stepOut:eq(1) .errors-in').append('<div class=\"alert alert-warning\">Bu işlem 1-2 dakikanızı alabilr. Lütfen bekleyiniz.</div>');
                $('[type=button]').addClass('AjaxLooder');
                $.ajax({
                    type: "POST",
                    url: "/install/default.aspx/DBCreate_Click", //web service ve methodumuz
                    data: '{ "TBDBServer":"' + $('#TBDBServer').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "TBDBName":"' + $('#TBDBName').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "TBDBUser":"' + $('#TBDBUser').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "TBDBSifre":"' + $('#TBDBSifre').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('.errors-in > div').remove('');

                        if (data.d == "1") {
                            $('a[href=#tab11]')[0].click();
                            $('a[href=#tab10]').next("a").find("span").addClass("label-success").removeClass("label-warning");
                            $('a[href=#tab11]').next("a").find("span").addClass("label-warning").removeClass("label-info");
                        }
                        else {
                            $('.stepOut:eq(1) .errors-out').css('display', 'block');
                            $('.stepOut:eq(1) .errors-in').append(data.d);
                        }
                    },
                    error: function () {
                        $('.errors-in > div').remove('');
                        $('.stepOut:eq(1) .errors-in').append('<div class=\"alert alert-danger\">Talep sunucuya gönderilemiyor.</div>');
                    }
                });
                $('[type=button]').removeClass('AjaxLooder');
            }
            tiklandi = false;
            $('[type=button]').removeAttr('disabled');
        }

        function FormPost4() {
            if (tiklandi)
                return;
            else
                tiklandi = true;

            isvalid = true;
            var dil = "";
            $('.errors-in > div').remove('');
            $('.errors-in > div').remove('');
            $('[type=button]').attr('disabled', 'disabled');

            $('.stepOut:eq(2) :text,.stepOut:eq(2) :password').each(function () {
                if (isvalid) {
                    if (!$(this).val()) {
                        $('.stepOut:eq(2) .errors-out').css('display', 'block');
                        $('.stepOut:eq(2) .errors-in').append('<div class=\"alert alert-danger\">Lütfen zorunlu alanları doldurunuz.</div>');
                        isvalid = false;
                        $(this).focus();
                    }
                }
            });

            $('.checkbox1 :checkbox:checked').each(function () {
                dil += $(this).val() + ',';
            });
            dil = dil.substring(0, dil.length - 1);

            if (isvalid) {
                $('.stepOut:eq(2) .errors-out').css('display', 'block');
                $('.stepOut:eq(2) .errors-in').append('<div class=\"alert alert-warning\">Bu işlem 1-2 dakikanızı alabilr. Lütfen bekleyiniz.</div>');
                $('[type=button]').addClass('AjaxLooder');
                $.ajax({
                    type: "POST",
                    url: "/install/default.aspx/DomainTanimla", //web service ve methodumuz
                    data: '{ "tadmin":"' + $('#tadmin').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "tsifre":"' + $('#tsifre').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "tposta":"' + $('#tposta').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "tackl":"' + $('#tackl').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "diller":"' + dil + '", "VarsContent":"' + $('[name=VarsContent]:checked').val() + '","TBDBServer":"' + $('#TBDBServer').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "TBDBName":"' + $('#TBDBName').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "TBDBUser":"' + $('#TBDBUser').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "TBDBSifre":"' + $('#TBDBSifre').val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '", "adminLang":"' + $("#SelectAdminLang").val() + '", "defaultLang":"' + $("#SelectLang").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('.errors-in > div').remove('');

                        if (data.d == "1") {
                            $('#sadmin').html($('#tadmin').val());
                            $('#ssifre').html($('#tsifre').val());
                            $('a[href=#tab12]')[0].click();
                            $('a[href=#tab11]').next("a").find("span").addClass("label-success").removeClass("label-warning");
                            $('a[href=#tab12]').next("a").find("span").addClass("label-warning").removeClass("label-info");
                        }
                        else {
                            $('.stepOut:eq(2) .errors-out').css('display', 'block');
                            $('.stepOut:eq(2) .errors-in').append(data.d);
                        }
                    },
                    error: function () {
                        $('.errors-in > div').remove('');
                        $('.stepOut:eq(2) .errors-in').append('<div class=\"alert alert-danger\">Talep sunucuya gönderilemiyor.</div>');
                    }
                });
                $('[type=button]').removeClass('AjaxLooder');
            }
            tiklandi = false;
            $('[type=button]').removeAttr('disabled');
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">

    <header class="header" style="opacity: 1;">
        <nav class="navbar">

            <div class="container mt-lg mb-lg text-center">


                <img alt="" src="/install/images/logo-white.png" style="width: 200px;" />



            </div>

        </nav>


    </header>


    <div id="install" class="wrapper">
        <div id="install-in" class="content container">

            <h5>Sanalog  <a href="http://www.gnu.org/licenses/gpl-3.0.en.html" target="_blank">GNU - Genel Kamu Lisansı</a> altında yayınlanmış özgür(Açık Kaynak) bir yazılımdır.</h5>

            <div class="row">

                <div class="col-sm-12">
                    <ul class="nav nav-tabs tabs-horizontal">
                        <li class="active">
                            <a href="#tab9" data-toggle="tab" style="display: none;"></a>
                            <a><span class="label label-warning">1</span> Başlangıç</a></li>
                        <li>
                            <a href="#tab10" data-toggle="tab" style="display: none;"></a>
                            <a><span class="label label-info">2</span> Veritabanı</a></li>
                        <li>
                            <a href="#tab11" data-toggle="tab" style="display: none;"></a>
                            <a><span class="label label-info">3</span> Yönetim</a></li>
                        <li>
                            <a href="#tab12" data-toggle="tab" style="display: none;"></a>
                            <a><span class="label label-info">4</span> Son</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab9">
                            <div class="stepOut stepOut-licence">

                                <div class="form-wrap">
                                    <div class="form-group">
                                        <iframe class="iframe-licence" src="/LICENCE.txt"></iframe>

                                    </div>

                                </div>

                                <div class="errors-out">
                                    <div class="errors-in">
                                    </div>
                                </div>

                                <p>
                                    <input required name="sozlesme" type="checkbox" value="1" />
                                    Sözleşmeyi Okudum ve Kabul ediyorum.
                                </p>

                                <a href="javascript:;" class="btn btn-success btn-lg" onclick="FormPost1();" />Devam Et&nbsp;&nbsp; <i class="fa fa-long-arrow-right"></i></a>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="tab10">
                            <div class="stepOut">




                                <div class="errors-out">
                                    <div class="errors-in">
                                    </div>
                                </div>
                                <div class="form-wrap">
                                    <div class="form-group">
                                        <label class="input-info">
                                            Hosting firmanızın SQL Server Sunucu adresini yazınız.
                                        </label>
                                        <input required id="TBDBServer" placeholder="SQL Sunucu: localhost ya da IP Adresi *" type="text" />
                                    </div>

                                    <div class="form-group">
                                        <label class="input-info">
                                            Sunucunuzda açmış olduğunuz (DB)Veritabanının ismini yazınız.
                                        </label>
                                        <input required id="TBDBName" type="text" placeholder="Veritabanı Adı *" />
                                    </div>
                                    <div class="form-group">
                                        <label class="input-info">
                                            DB(SQL) Kullanıcı adı ve şifreye bilgilerini yazınız.
                                        </label>
                                        <input required id="TBDBUser" type="text" placeholder="Veritabanı Kullanıcı Adı *" />
                                    </div>
                                    <div class="form-group">
                                        <input required id="TBDBSifre" type="password" placeholder="Veritabanı Şifre *" />
                                    </div>


                                    <p class="mt-md" style="display: none !important;">
                                        <input type="radio" name="VarsContent" value="1" checked="checked" />
                                        Varsayılan site içeriğini oluştur.
                                        <label class="input-info">(Sanalog default temadaki varsayılan ayarlar hazır şekilde kurulur.)</label><br />
                                        <input type="radio" name="VarsContent" value="0" />
                                        Varsayılan site içeriğini oluşturma. (Boş site).
                                    </p>

                                </div>
                                <a href="javascript:;" class="btn btn-success btn-lg" onclick="FormPost3();" />Devam Et&nbsp;&nbsp; <i class="fa fa-long-arrow-right"></i></a>
                                  
                            
                            </div>

                        </div>
                        <div class="tab-pane fade" id="tab11">
                            <div class="stepOut">
                            

                                <div class="errors-out">
                                    <div class="errors-in">
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-sm-8">
<h5 class="infotext">Yönetici Panel Bilgileri</h5>

                                <div class="form-wrap">

                                    <div class="form-group">
                                        <input type="text" required id="tadmin" maxlength="25" placeholder="Kullanıcı Adı *" />
                                    </div>
                                    <div class="form-group">
                                        <input type="password" required id="tsifre" maxlength="12" placeholder="Şifre *" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required id="tposta" maxlength="75" placeholder="E-posta Adresi" />
                                    </div>
                                    <div class="form-group">
                                        <textarea id="tackl" placeholder="Açıklama"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="input-info">
                                            Admin Paneli (Yönetim Paneli) dilini seçiniz.
                                        </label>
                                        <select id="SelectAdminLang">
                                            <option value="31">Türkçe</option>
                                            <option value="9">İngilizce</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="input-info">
                                            Sitenin varsayılan dilini seçiniz. (Sağ taraftaki dil panelinden bu kısma dilediğiniz kadar dil ekleyebilirsiniz.)
                                        </label>
                                        <select id="SelectLang">
                                            <option value="31">Türkçe</option>
                                        </select>
                                    </div>

                                </div>

                                    </div>
                                    <div class="col-sm-4">
<h5 class="infotext">Site Dil Paneli</h5>
<div class="checkbox1 languages-container">
                                  
                                            <ul class="language-select">
                                                <li>
                                                    <input type="checkbox" value="31" checked disabled />
                                                    tr (Türkçe) </li>
                                                <li>
                                                    <input type="checkbox" value="9" />
                                                    en (English) </li>
                                                 <li>
                                                    <input type="checkbox" value="7" />
                                                    de (Deutsch) </li>
                                                     <li>
                                                    <input type="checkbox" value="10" />
                                                    es (español) </li>
                                                <li>
                                                    <input type="checkbox" value="16" />
                                                    it (italiano) </li>
                                                <li>
                                                    <input type="checkbox" value="1155" />
                                                    co-FR (Corsu (France)) </li>
                                                <li>
                                                    <input type="checkbox" value="24" />
                                                    ro (română) </li>
                                                <li>
                                                    <input type="checkbox" value="54" />
                                                    af (Afrikaans) </li>
                                                <li>
                                                    <input type="checkbox" value="1078" />
                                                    af-ZA (Afrikaans (Suid Afrika)) </li>
                                                <li>
                                                    <input type="checkbox" value="1118" />
                                                    am-ET (አማርኛ (ኢትዮጵያ)) </li>
                                                <li>
                                                    <input type="checkbox" value="1" />
                                                    ar (العربية) </li>
                                                <li>
                                                    <input type="checkbox" value="14337" />
                                                    ar-AE (العربية (الإمارات العربية المتحدة)) </li>
                                                <li>
                                                    <input type="checkbox" value="15361" />
                                                    ar-BH (العربية (البحرين)) </li>
                                                <li>
                                                    <input type="checkbox" value="5121" />
                                                    ar-DZ (العربية (الجزائر)) </li>
                                                <li>
                                                    <input type="checkbox" value="3073" />
                                                    ar-EG (العربية (مصر)) </li>
                                                <li>
                                                    <input type="checkbox" value="2049" />
                                                    ar-IQ (العربية (العراق)) </li>
                                                <li>
                                                    <input type="checkbox" value="11265" />
                                                    ar-JO (العربية (الأردن)) </li>
                                                <li>
                                                    <input type="checkbox" value="13313" />
                                                    ar-KW (العربية (الكويت)) </li>
                                                <li>
                                                    <input type="checkbox" value="12289" />
                                                    ar-LB (العربية (لبنان)) </li>
                                                <li>
                                                    <input type="checkbox" value="4097" />
                                                    ar-LY (العربية (ليبيا)) </li>
                                                <li>
                                                    <input type="checkbox" value="6145" />
                                                    ar-MA (العربية (المملكة المغربية)) </li>
                                                <li>
                                                    <input type="checkbox" value="1146" />
                                                    arn-CL (Mapudungun (Chile)) </li>
                                                <li>
                                                    <input type="checkbox" value="8193" />
                                                    ar-OM (العربية (عمان)) </li>
                                                <li>
                                                    <input type="checkbox" value="16385" />
                                                    ar-QA (العربية (قطر)) </li>
                                                <li>
                                                    <input type="checkbox" value="1025" />
                                                    ar-SA (العربية (المملكة العربية السعودية)) </li>
                                                <li>
                                                    <input type="checkbox" value="10241" />
                                                    ar-SY (العربية (سوريا)) </li>
                                                <li>
                                                    <input type="checkbox" value="7169" />
                                                    ar-TN (العربية (تونس)) </li>
                                                <li>
                                                    <input type="checkbox" value="9217" />
                                                    ar-YE (العربية (اليمن)) </li>
                                                <li>
                                                    <input type="checkbox" value="1101" />
                                                    as-IN (অসমীয়া (ভাৰত)) </li>
                                                <li>
                                                    <input type="checkbox" value="44" />
                                                    az (Azərbaycan­ılı) </li>
                                                <li>
                                                    <input type="checkbox" value="2092" />
                                                    az-Cyrl-AZ (Азәрбајҹан (Азәрбајҹан)) </li>
                                                <li>
                                                    <input type="checkbox" value="1068" />
                                                    az-Latn-AZ (Azərbaycan­ılı (Azərbaycanca)) </li>
                                                <li>
                                                    <input type="checkbox" value="1133" />
                                                    ba-RU (Башҡорт (Россия)) </li>
                                                <li>
                                                    <input type="checkbox" value="35" />
                                                    be (Беларускі) </li>
                                                <li>
                                                    <input type="checkbox" value="1059" />
                                                    be-BY (Беларускі (Беларусь)) </li>
                                                <li>
                                                    <input type="checkbox" value="2" />
                                                    bg (български) </li>
                                                <li>
                                                    <input type="checkbox" value="1026" />
                                                    bg-BG (български (България)) </li>
                                                <li>
                                                    <input type="checkbox" value="2117" />
                                                    bn-BD (বাংলা (বাংলাদেশ)) </li>
                                                <li>
                                                    <input type="checkbox" value="1093" />
                                                    bn-IN (বাংলা (ভারত)) </li>
                                                <li>
                                                    <input type="checkbox" value="1105" />
                                                    bo-CN (བོད་ཡིག (ཀྲུང་ཧྭ་མི་དམངས་སྤྱི་མཐུན་རྒྱལ་ཁབ།)) </li>
                                                <li>
                                                    <input type="checkbox" value="1150" />
                                                    br-FR (brezhoneg (Frañs)) </li>
                                                <li>
                                                    <input type="checkbox" value="8218" />
                                                    bs-Cyrl-BA (босански (Босна и Херцеговина)) </li>
                                                <li>
                                                    <input type="checkbox" value="5146" />
                                                    bs-Latn-BA (bosanski (Bosna i Hercegovina)) </li>
                                                <li>
                                                    <input type="checkbox" value="3" />
                                                    ca (català) </li>
                                                <li>
                                                    <input type="checkbox" value="1027" />
                                                    ca-ES (català (català)) </li>
                                               
                                                <li>
                                                    <input type="checkbox" value="5" />
                                                    cs (čeština) </li>
                                                <li>
                                                    <input type="checkbox" value="1029" />
                                                    cs-CZ (čeština (Česká republika)) </li>
                                                <li>
                                                    <input type="checkbox" value="1106" />
                                                    cy-GB (Cymraeg (y Deyrnas Unedig)) </li>
                                                <li>
                                                    <input type="checkbox" value="6" />
                                                    da (dansk) </li>
                                                <li>
                                                    <input type="checkbox" value="1030" />
                                                    da-DK (dansk (Danmark)) </li>
                                               
                                                 
                                                <li>
                                                <li>
                                                    <input type="checkbox" value="3079" />
                                                    de-AT (Deutsch (Österreich)) </li>
                                                <li>
                                                    <input type="checkbox" value="2055" />
                                                    de-CH (Deutsch (Schweiz)) </li>
                                                <li>
                                                    <input type="checkbox" value="1031" />
                                                    de-DE (Deutsch (Deutschland)) </li>
                                                <li>
                                                    <input type="checkbox" value="5127" />
                                                    de-LI (Deutsch (Liechtenstein)) </li>
                                                <li>
                                                    <input type="checkbox" value="4103" />
                                                    de-LU (Deutsch (Luxemburg)) </li>
                                                <li>
                                                    <input type="checkbox" value="2094" />
                                                    dsb-DE (dolnoserbšćina (Nimska)) </li>
                                                <li>
                                                    <input type="checkbox" value="101" />
                                                    dv (ދިވެހިބަސް) </li>
                                                <li>
                                                    <input type="checkbox" value="1125" />
                                                    dv-MV (ދިވެހިބަސް (ދިވެހި ރާއްޖެ)) </li>
                                                <li>
                                                    <input type="checkbox" value="8" />
                                                    el (ελληνικά) </li>
                                                <li>
                                                    <input type="checkbox" value="1032" />
                                                    el-GR (ελληνικά (Ελλάδα)) </li>
                                                <li>
                                                    <input type="checkbox" value="9225" />
                                                    en-029 (English (Caribbean)) </li>
                                                <li>
                                                    <input type="checkbox" value="3081" />
                                                    en-AU (English (Australia)) </li>
                                                <li>
                                                    <input type="checkbox" value="10249" />
                                                    en-BZ (English (Belize)) </li>
                                                <li>
                                                    <input type="checkbox" value="4105" />
                                                    en-CA (English (Canada)) </li>
                                                <li>
                                                    <input type="checkbox" value="2057" />
                                                    en-GB (English (United Kingdom)) </li>
                                                <li>
                                                    <input type="checkbox" value="6153" />
                                                    en-IE (English (Eire)) </li>
                                                <li>
                                                    <input type="checkbox" value="16393" />
                                                    en-IN (English (India)) </li>
                                                <li>
                                                    <input type="checkbox" value="8201" />
                                                    en-JM (English (Jamaica)) </li>
                                                <li>
                                                    <input type="checkbox" value="17417" />
                                                    en-MY (English (Malaysia)) </li>
                                                <li>
                                                    <input type="checkbox" value="5129" />
                                                    en-NZ (English (New Zealand)) </li>
                                                <li>
                                                    <input type="checkbox" value="13321" />
                                                    en-PH (English (Philippines)) </li>
                                                <li>
                                                    <input type="checkbox" value="18441" />
                                                    en-SG (English (Singapore)) </li>
                                                <li>
                                                    <input type="checkbox" value="11273" />
                                                    en-TT (English (Trinidad y Tobago)) </li>
                                                <li>
                                                    <input type="checkbox" value="1033" />
                                                    en-US (Englisih (USA)) </li>
                                                <li>
                                                    <input type="checkbox" value="7177" />
                                                    en-ZA (English (South Africa)) </li>
                                                <li>
                                                    <input type="checkbox" value="12297" />
                                                    en-ZW (English (Zimbabwe)) </li>
                                                
                                                    
                                                   
                                                <li>
                                                    <input type="checkbox" value="11274" />
                                                    es-AR (Español (Argentina)) </li>
                                                <li>
                                                    <input type="checkbox" value="16394" />
                                                    es-BO (Español (Bolivia)) </li>
                                                <li>
                                                    <input type="checkbox" value="13322" />
                                                    es-CL (Español (Chile)) </li>
                                                <li>
                                                    <input type="checkbox" value="9226" />
                                                    es-CO (Español (Colombia)) </li>
                                                <li>
                                                    <input type="checkbox" value="5130" />
                                                    es-CR (Español (Costa Rica)) </li>
                                                <li>
                                                    <input type="checkbox" value="7178" />
                                                    es-DO (Español (República Dominicana)) </li>
                                                <li>
                                                    <input type="checkbox" value="12298" />
                                                    es-EC (Español (Ecuador)) </li>
                                                <li>
                                                    <input type="checkbox" value="3082" />
                                                    es-ES (español (España)) </li>
                                                <li>
                                                    <input type="checkbox" value="4106" />
                                                    es-GT (Español (Guatemala)) </li>
                                                <li>
                                                    <input type="checkbox" value="18442" />
                                                    es-HN (Español (Honduras)) </li>
                                                <li>
                                                    <input type="checkbox" value="2058" />
                                                    es-MX (Español (México)) </li>
                                                <li>
                                                    <input type="checkbox" value="19466" />
                                                    es-NI (Español (Nicaragua)) </li>
                                                <li>
                                                    <input type="checkbox" value="6154" />
                                                    es-PA (Español (Panamá)) </li>
                                                <li>
                                                    <input type="checkbox" value="10250" />
                                                    es-PE (Español (Perú)) </li>
                                                <li>
                                                    <input type="checkbox" value="20490" />
                                                    es-PR (Español (Puerto Rico)) </li>
                                                <li>
                                                    <input type="checkbox" value="15370" />
                                                    es-PY (Español (Paraguay)) </li>
                                                <li>
                                                    <input type="checkbox" value="17418" />
                                                    es-SV (Español (El Salvador)) </li>
                                                <li>
                                                    <input type="checkbox" value="21514" />
                                                    es-US (Español (Estados Unidos)) </li>
                                                <li>
                                                    <input type="checkbox" value="14346" />
                                                    es-UY (Español (Uruguay)) </li>
                                                <li>
                                                    <input type="checkbox" value="8202" />
                                                    es-VE (Español (Republica Bolivariana de Venezuela)) </li>
                                                <li>
                                                    <input type="checkbox" value="37" />
                                                    et (eesti) </li>
                                                <li>
                                                    <input type="checkbox" value="1061" />
                                                    et-EE (eesti (Eesti)) </li>
                                                <li>
                                                    <input type="checkbox" value="45" />
                                                    eu (euskara) </li>
                                                <li>
                                                    <input type="checkbox" value="1069" />
                                                    eu-ES (euskara (euskara)) </li>
                                                <li>
                                                    <input type="checkbox" value="41" />
                                                    fa (فارسى) </li>
                                                <li>
                                                    <input type="checkbox" value="1065" />
                                                    fa-IR (فارسى (ايران)) </li>
                                                <li>
                                                    <input type="checkbox" value="11" />
                                                    fi (suomi) </li>
                                                <li>
                                                    <input type="checkbox" value="1035" />
                                                    fi-FI (suomi (Suomi)) </li>
                                                <li>
                                                    <input type="checkbox" value="1124" />
                                                    fil-PH (Filipino (Pilipinas)) </li>
                                                <li>
                                                    <input type="checkbox" value="56" />
                                                    fo (føroyskt) </li>
                                                <li>
                                                    <input type="checkbox" value="1080" />
                                                    fo-FO (føroyskt (Føroyar)) </li>
                                                <li>
                                                    <input type="checkbox" value="12" />
                                                    fr (français) </li>
                                                <li>
                                                    <input type="checkbox" value="2060" />
                                                    fr-BE (français (Belgique)) </li>
                                                <li>
                                                    <input type="checkbox" value="3084" />
                                                    fr-CA (français (Canada)) </li>
                                                <li>
                                                    <input type="checkbox" value="4108" />
                                                    fr-CH (français (Suisse)) </li>
                                                <li>
                                                    <input type="checkbox" value="1036" />
                                                    fr-FR (français (France)) </li>
                                                <li>
                                                    <input type="checkbox" value="5132" />
                                                    fr-LU (français (Luxembourg)) </li>
                                                <li>
                                                    <input type="checkbox" value="6156" />
                                                    fr-MC (français (Principauté de Monaco)) </li>
                                                <li>
                                                    <input type="checkbox" value="1122" />
                                                    fy-NL (Frysk (Nederlân)) </li>
                                                <li>
                                                    <input type="checkbox" value="2108" />
                                                    ga-IE (Gaeilge (Éire)) </li>
                                                <li>
                                                    <input type="checkbox" value="86" />
                                                    gl (galego) </li>
                                                <li>
                                                    <input type="checkbox" value="1110" />
                                                    gl-ES (galego (galego)) </li>
                                                <li>
                                                    <input type="checkbox" value="1156" />
                                                    gsw-FR (Elsässisch (Frànkrisch)) </li>
                                                <li>
                                                    <input type="checkbox" value="71" />
                                                    gu (ગુજરાતી) </li>
                                                <li>
                                                    <input type="checkbox" value="1095" />
                                                    gu-IN (ગુજરાતી (ભારત)) </li>
                                                <li>
                                                    <input type="checkbox" value="1128" />
                                                    ha-Latn-NG (Hausa (Nigeria)) </li>
                                                <li>
                                                    <input type="checkbox" value="13" />
                                                    he (עברית) </li>
                                                <li>
                                                    <input type="checkbox" value="1037" />
                                                    he-IL (עברית (ישראל)) </li>
                                                <li>
                                                    <input type="checkbox" value="57" />
                                                    hi (हिंदी) </li>
                                                <li>
                                                    <input type="checkbox" value="1081" />
                                                    hi-IN (हिंदी (भारत)) </li>
                                                <li>
                                                    <input type="checkbox" value="26" />
                                                    hr (hrvatski) </li>
                                                <li>
                                                    <input type="checkbox" value="4122" />
                                                    hr-BA (hrvatski (Bosna i Hercegovina)) </li>
                                                <li>
                                                    <input type="checkbox" value="1050" />
                                                    hr-HR (hrvatski (Hrvatska)) </li>
                                                <li>
                                                    <input type="checkbox" value="1070" />
                                                    hsb-DE (hornjoserbšćina (Němska)) </li>
                                                <li>
                                                    <input type="checkbox" value="14" />
                                                    hu (magyar) </li>
                                                <li>
                                                    <input type="checkbox" value="1038" />
                                                    hu-HU (magyar (Magyarország)) </li>
                                                <li>
                                                    <input type="checkbox" value="43" />
                                                    hy (Հայերեն) </li>
                                                <li>
                                                    <input type="checkbox" value="1067" />
                                                    hy-AM (Հայերեն (Հայաստան)) </li>
                                                <li>
                                                    <input type="checkbox" value="33" />
                                                    id (Bahasa Indonesia) </li>
                                                <li>
                                                    <input type="checkbox" value="1057" />
                                                    id-ID (Bahasa Indonesia (Indonesia)) </li>
                                                <li>
                                                    <input type="checkbox" value="1136" />
                                                    ig-NG (Igbo (Nigeria)) </li>
                                                <li>
                                                    <input type="checkbox" value="1144" />
                                                    ii-CN (ꆈꌠꁱꂷ (ꍏꉸꏓꂱꇭꉼꇩ)) </li>
                                                <li>
                                                    <input type="checkbox" value="15" />
                                                    is (íslenska) </li>
                                                <li>
                                                    <input type="checkbox" value="1039" />
                                                    is-IS (íslenska (Ísland)) </li>
                                               
                                                    <input type="checkbox" value="2064" />
                                                    it-CH (italiano (Svizzera)) </li>
                                                <li>
                                                    <input type="checkbox" value="1040" />
                                                    it-IT (italiano (Italia)) </li>
                                                <li>
                                                    <input type="checkbox" value="1117" />
                                                    iu-Cans-CA (ᐃᓄᒃᑎᑐᑦ (ᑲᓇᑕ)) </li>
                                                <li>
                                                    <input type="checkbox" value="2141" />
                                                    iu-Latn-CA (Inuktitut (Kanatami) (kanata)) </li>
                                                <li>
                                                    <input type="checkbox" value="17" />
                                                    ja (日本語) </li>
                                                <li>
                                                    <input type="checkbox" value="1041" />
                                                    ja-JP (日本語 (日本)) </li>
                                                <li>
                                                    <input type="checkbox" value="55" />
                                                    ka (ქართული) </li>
                                                <li>
                                                    <input type="checkbox" value="1079" />
                                                    ka-GE (ქართული (საქართველო)) </li>
                                                <li>
                                                    <input type="checkbox" value="63" />
                                                    kk (Қазащb) </li>
                                                <li>
                                                    <input type="checkbox" value="1087" />
                                                    kk-KZ (Қазақ (Қазақстан)) </li>
                                                <li>
                                                    <input type="checkbox" value="1135" />
                                                    kl-GL (kalaallisut (Kalaallit Nunaat)) </li>
                                                <li>
                                                    <input type="checkbox" value="1107" />
                                                    km-KH (ខ្មែរ (កម្ពុជា)) </li>
                                                <li>
                                                    <input type="checkbox" value="75" />
                                                    kn (ಕನ್ನಡ) </li>
                                                <li>
                                                    <input type="checkbox" value="1099" />
                                                    kn-IN (ಕನ್ನಡ (ಭಾರತ)) </li>
                                                <li>
                                                    <input type="checkbox" value="18" />
                                                    ko (한국어) </li>
                                                <li>
                                                    <input type="checkbox" value="87" />
                                                    kok (कोंकणी) </li>
                                                <li>
                                                    <input type="checkbox" value="1111" />
                                                    kok-IN (कोंकणी (भारत)) </li>
                                                <li>
                                                    <input type="checkbox" value="1042" />
                                                    ko-KR (한국어 (대한민국)) </li>
                                                <li>
                                                    <input type="checkbox" value="64" />
                                                    ky (Кыргыз) </li>
                                                <li>
                                                    <input type="checkbox" value="1088" />
                                                    ky-KG (Кыргыз (Кыргызстан)) </li>
                                                <li>
                                                    <input type="checkbox" value="1134" />
                                                    lb-LU (Lëtzebuergesch (Luxembourg)) </li>
                                                <li>
                                                    <input type="checkbox" value="1108" />
                                                    lo-LA (ລາວ (ສ.ປ.ປ. ລາວ)) </li>
                                                <li>
                                                    <input type="checkbox" value="39" />
                                                    lt (lietuvių) </li>
                                                <li>
                                                    <input type="checkbox" value="1063" />
                                                    lt-LT (lietuvių (Lietuva)) </li>
                                                <li>
                                                    <input type="checkbox" value="38" />
                                                    lv (latviešu) </li>
                                                <li>
                                                    <input type="checkbox" value="1062" />
                                                    lv-LV (latviešu (Latvija)) </li>
                                                <li>
                                                    <input type="checkbox" value="1153" />
                                                    mi-NZ (Reo Māori (Aotearoa)) </li>
                                                <li>
                                                    <input type="checkbox" value="47" />
                                                    mk (македонски јазик) </li>
                                                <li>
                                                    <input type="checkbox" value="1071" />
                                                    mk-MK (македонски јазик (Македонија)) </li>
                                                <li>
                                                    <input type="checkbox" value="1100" />
                                                    ml-IN (മലയാളം (ഭാരതം)) </li>
                                                <li>
                                                    <input type="checkbox" value="80" />
                                                    mn (Монгол хэл) </li>
                                                <li>
                                                    <input type="checkbox" value="1104" />
                                                    mn-MN (Монгол хэл (Монгол улс)) </li>
                                                <li>
                                                    <input type="checkbox" value="2128" />
                                                    mn-Mong-CN (ᠮᠤᠨᠭᠭᠤᠯ ᠬᠡᠯᠡ (ᠪᠦᠭᠦᠳᠡ ᠨᠠᠢᠷᠠᠮᠳᠠᠬᠤ ᠳᠤᠮᠳᠠᠳᠤ ᠠᠷᠠᠳ ᠣᠯᠣᠰ)) </li>
                                                <li>
                                                    <input type="checkbox" value="1148" />
                                                    moh-CA (Kanien'kéha (Canada)) </li>
                                                <li>
                                                    <input type="checkbox" value="78" />
                                                    mr (मराठी) </li>
                                                <li>
                                                    <input type="checkbox" value="1102" />
                                                    mr-IN (मराठी (भारत)) </li>
                                                <li>
                                                    <input type="checkbox" value="62" />
                                                    ms (Bahasa Malaysia) </li>
                                                <li>
                                                    <input type="checkbox" value="2110" />
                                                    ms-BN (Bahasa Malaysia (Brunei Darussalam)) </li>
                                                <li>
                                                    <input type="checkbox" value="1086" />
                                                    ms-MY (Bahasa Malaysia (Malaysia)) </li>
                                                <li>
                                                    <input type="checkbox" value="1082" />
                                                    mt-MT (Malti (Malta)) </li>
                                                <li>
                                                    <input type="checkbox" value="1044" />
                                                    nb-NO (norsk, bokmål (Norge)) </li>
                                                <li>
                                                    <input type="checkbox" value="1121" />
                                                    ne-NP (नेपाली (नेपाल)) </li>
                                                <li>
                                                    <input type="checkbox" value="19" />
                                                    nl (Nederlands) </li>
                                                <li>
                                                    <input type="checkbox" value="2067" />
                                                    nl-BE (Nederlands (België)) </li>
                                                <li>
                                                    <input type="checkbox" value="1043" />
                                                    nl-NL (Nederlands (Nederland)) </li>
                                                <li>
                                                    <input type="checkbox" value="2068" />
                                                    nn-NO (norsk, nynorsk (Noreg)) </li>
                                                <li>
                                                    <input type="checkbox" value="20" />
                                                    no (norsk) </li>
                                                <li>
                                                    <input type="checkbox" value="1132" />
                                                    nso-ZA (Sesotho sa Leboa (Afrika Borwa)) </li>
                                                <li>
                                                    <input type="checkbox" value="1154" />
                                                    oc-FR (Occitan (França)) </li>
                                                <li>
                                                    <input type="checkbox" value="1096" />
                                                    or-IN (ଓଡ଼ିଆ (ଭାରତ)) </li>
                                                <li>
                                                    <input type="checkbox" value="70" />
                                                    pa (ਪੰਜਾਬੀ) </li>
                                                <li>
                                                    <input type="checkbox" value="1094" />
                                                    pa-IN (ਪੰਜਾਬੀ (ਭਾਰਤ)) </li>
                                                <li>
                                                    <input type="checkbox" value="21" />
                                                    pl (polski) </li>
                                                <li>
                                                    <input type="checkbox" value="1045" />
                                                    pl-PL (polski (Polska)) </li>
                                                <li>
                                                    <input type="checkbox" value="1164" />
                                                    prs-AF (درى (افغانستان)) </li>
                                                <li>
                                                    <input type="checkbox" value="1123" />
                                                    ps-AF (پښتو (افغانستان)) </li>
                                                <li>
                                                    <input type="checkbox" value="22" />
                                                    pt (Português) </li>
                                                <li>
                                                    <input type="checkbox" value="1046" />
                                                    pt-BR (Português (Brasil)) </li>
                                                <li>
                                                    <input type="checkbox" value="2070" />
                                                    pt-PT (português (Portugal)) </li>
                                                <li>
                                                    <input type="checkbox" value="1158" />
                                                    qut-GT (K'iche (Guatemala)) </li>
                                                <li>
                                                    <input type="checkbox" value="1131" />
                                                    quz-BO (runasimi (Bolivia Suyu)) </li>
                                                <li>
                                                    <input type="checkbox" value="2155" />
                                                    quz-EC (runasimi (Ecuador Suyu)) </li>
                                                <li>
                                                    <input type="checkbox" value="3179" />
                                                    quz-PE (runasimi (Peru Suyu)) </li>
                                                <li>
                                                    <input type="checkbox" value="1047" />
                                                    rm-CH (Rumantsch (Svizra)) </li>
                                                 
                                                <li>
                                                    <input type="checkbox" value="1048" />
                                                    ro-RO (română (România)) </li>
                                                <li>
                                                    <input type="checkbox" value="25" />
                                                    ru (русский) </li>
                                                <li>
                                                    <input type="checkbox" value="1049" />
                                                    ru-RU (русский (Россия)) </li>
                                                                                                <li>
                                                    <input type="checkbox" value="1159" />
                                                    rw-RW (Kinyarwanda (Rwanda)) </li>
                                                <li>
                                                    <input type="checkbox" value="79" />
                                                    sa (संस्कृत) </li>
                                                <li>
                                                    <input type="checkbox" value="1157" />
                                                    sah-RU (саха (Россия)) </li>
                                                <li>
                                                    <input type="checkbox" value="1103" />
                                                    sa-IN (संस्कृत (भारतम्)) </li>
                                                <li>
                                                    <input type="checkbox" value="3131" />
                                                    se-FI (davvisámegiella (Suopma)) </li>
                                                <li>
                                                    <input type="checkbox" value="1083" />
                                                    se-NO (davvisámegiella (Norga)) </li>
                                                <li>
                                                    <input type="checkbox" value="2107" />
                                                    se-SE (davvisámegiella (Ruoŧŧa)) </li>
                                                <li>
                                                    <input type="checkbox" value="1115" />
                                                    si-LK (සිංහ (ශ්‍රී ලංකා)) </li>
                                                <li>
                                                    <input type="checkbox" value="27" />
                                                    sk (slovenčina) </li>
                                                <li>
                                                    <input type="checkbox" value="1051" />
                                                    sk-SK (slovenčina (Slovenská republika)) </li>
                                                <li>
                                                    <input type="checkbox" value="36" />
                                                    sl (slovenski) </li>
                                                <li>
                                                    <input type="checkbox" value="1060" />
                                                    sl-SI (slovenski (Slovenija)) </li>
                                                <li>
                                                    <input type="checkbox" value="6203" />
                                                    sma-NO (åarjelsaemiengiele (Nöörje)) </li>
                                                <li>
                                                    <input type="checkbox" value="7227" />
                                                    sma-SE (åarjelsaemiengiele (Sveerje)) </li>
                                                <li>
                                                    <input type="checkbox" value="4155" />
                                                    smj-NO (julevusámegiella (Vuodna)) </li>
                                                <li>
                                                    <input type="checkbox" value="5179" />
                                                    smj-SE (julevusámegiella (Svierik)) </li>
                                                <li>
                                                    <input type="checkbox" value="9275" />
                                                    smn-FI (sämikielâ (Suomâ)) </li>
                                                <li>
                                                    <input type="checkbox" value="8251" />
                                                    sms-FI (sääm´ǩiõll (Lää´ddjânnam)) </li>
                                                <li>
                                                    <input type="checkbox" value="28" />
                                                    sq (shqipe) </li>
                                                <li>
                                                    <input type="checkbox" value="1052" />
                                                    sq-AL (shqipe (Shqipëria)) </li>
                                                <li>
                                                    <input type="checkbox" value="31770" />
                                                    sr (srpski) </li>
                                                <li>
                                                    <input type="checkbox" value="7194" />
                                                    sr-Cyrl-BA (српски (Босна и Херцеговина)) </li>
                                                <li>
                                                    <input type="checkbox" value="3098" />
                                                    sr-Cyrl-CS (српски (Србија)) </li>
                                                <li>
                                                    <input type="checkbox" value="6170" />
                                                    sr-Latn-BA (srpski (Bosna i Hercegovina)) </li>
                                                <li>
                                                    <input type="checkbox" value="2074" />
                                                    sr-Latn-CS (srpski (Srbija)) </li>
                                                <li>
                                                    <input type="checkbox" value="29" />
                                                    sv (svenska) </li>
                                                <li>
                                                    <input type="checkbox" value="2077" />
                                                    sv-FI (svenska (Finland)) </li>
                                                <li>
                                                    <input type="checkbox" value="1053" />
                                                    sv-SE (svenska (Sverige)) </li>
                                                <li>
                                                    <input type="checkbox" value="65" />
                                                    sw (Kiswahili) </li>
                                                <li>
                                                    <input type="checkbox" value="1089" />
                                                    sw-KE (Kiswahili (Kenya)) </li>
                                                <li>
                                                    <input type="checkbox" value="90" />
                                                    syr (ܣܘܪܝܝܐ) </li>
                                                <li>
                                                    <input type="checkbox" value="1114" />
                                                    syr-SY (ܣܘܪܝܝܐ (سوريا)) </li>
                                                <li>
                                                    <input type="checkbox" value="73" />
                                                    ta (தமிழ்) </li>
                                                <li>
                                                    <input type="checkbox" value="1097" />
                                                    ta-IN (தமிழ் (இந்தியா)) </li>
                                                <li>
                                                    <input type="checkbox" value="74" />
                                                    te (తెలుగు) </li>
                                                <li>
                                                    <input type="checkbox" value="1098" />
                                                    te-IN (తెలుగు (భారత దేశం)) </li>
                                                <li>
                                                    <input type="checkbox" value="1064" />
                                                    tg-Cyrl-TJ (Тоҷикӣ (Тоҷикистон)) </li>
                                                <li>
                                                    <input type="checkbox" value="30" />
                                                    th (ไทย) </li>
                                                <li>
                                                    <input type="checkbox" value="1054" />
                                                    th-TH (ไทย (ไทย)) </li>
                                                <li>
                                                    <input type="checkbox" value="1090" />
                                                    tk-TM (türkmençe (Türkmenistan)) </li>
                                                <li>
                                                    <input type="checkbox" value="1074" />
                                                    tn-ZA (Setswana (Aforika Borwa)) </li>
                                                <li>
                                                    <input type="checkbox" value="68" />
                                                    tt (Татар) </li>
                                                <li>
                                                    <input type="checkbox" value="1092" />
                                                    tt-RU (Татар (Россия)) </li>
                                                <li>
                                                    <input type="checkbox" value="2143" />
                                                    tzm-Latn-DZ (Tamazight (Djazaïr)) </li>
                                                <li>
                                                    <input type="checkbox" value="1152" />
                                                    ug-CN (ئۇيغۇر يېزىقى (جۇڭخۇا خەلق جۇمھۇرىيىتى)) </li>
                                                <li>
                                                    <input type="checkbox" value="34" />
                                                    uk (україньска) </li>
                                                <li>
                                                    <input type="checkbox" value="1058" />
                                                    uk-UA (україньска (Україна)) </li>
                                                <li>
                                                    <input type="checkbox" value="32" />
                                                    ur (اُردو) </li>
                                                <li>
                                                    <input type="checkbox" value="1056" />
                                                    ur-PK (اُردو (پاکستان)) </li>
                                                <li>
                                                    <input type="checkbox" value="67" />
                                                    uz (U'zbek) </li>
                                                <li>
                                                    <input type="checkbox" value="2115" />
                                                    uz-Cyrl-UZ (Ўзбек (Ўзбекистон)) </li>
                                                <li>
                                                    <input type="checkbox" value="1091" />
                                                    uz-Latn-UZ (U'zbek (U'zbekiston Respublikasi)) </li>
                                                <li>
                                                    <input type="checkbox" value="42" />
                                                    vi (Tiếng Việt) </li>
                                                <li>
                                                    <input type="checkbox" value="1066" />
                                                    vi-VN (Tiếng Việt (Việt Nam)) </li>
                                                <li>
                                                    <input type="checkbox" value="1160" />
                                                    wo-SN (Wolof (Sénégal)) </li>
                                                <li>
                                                    <input type="checkbox" value="1076" />
                                                    xh-ZA (isiXhosa (uMzantsi Afrika)) </li>
                                                <li>
                                                    <input type="checkbox" value="1130" />
                                                    yo-NG (Yoruba (Nigeria)) </li>
                                                <li>
                                                    <input type="checkbox" value="4" />
                                                    zh-CHS (中文(简体)) </li>
                                                <li>
                                                    <input type="checkbox" value="31748" />
                                                    zh-CHT (中文(繁體)) </li>
                                                <li>
                                                    <input type="checkbox" value="2052" />
                                                    zh-CN (中文(中华人民共和国)) </li>
                                                <li>
                                                    <input type="checkbox" value="3076" />
                                                    zh-HK (中文 (香港特别行政區)) </li>
                                                <li>
                                                    <input type="checkbox" value="5124" />
                                                    zh-MO (中文(澳門特别行政區)) </li>
                                                <li>
                                                    <input type="checkbox" value="4100" />
                                                    zh-SG (中文(新加坡)) </li>
                                                <li>
                                                    <input type="checkbox" value="1028" />
                                                    zh-TW (中文(台灣)) </li>
                                                <li>
                                                    <input type="checkbox" value="1077" />
                                                    zu-ZA (isiZulu (iNingizimu Afrika))</li>

                                            </ul>
                                    

                                    </div>


                                    </div>
                                </div>

                                <a href="javascript:;" class="btn btn-success btn-lg" onclick="FormPost4();" />Kurulumu Tamamla&nbsp;&nbsp; <i class="fa fa-long-arrow-right"></i></a>

                            </div>
                        </div>

                        <div class="tab-pane fade" id="tab12">
                            <div class="stepOut">
                                <h2><span class="label label-success"><i class="fa fa-check"></i></span> Tebrikler Sanaloger! Sanalog kurulumunu başarıyla tamamlandın.</h2>

                                <p>Artık bundan sonra yapabileceklerin konusunda SINIR SENSİN. Web siteni dilediğin gibi tasarlayabilirsin. Yardım almak istediğin konular olursa <a href="http://forum.sanalog.org/" target="_blank">forum.sanalog.org</a> platformunda Sanaloger topluluğundan yardım alabilirsiniz. Ayrıca genel bilgilendirmeler için <a href="http://www.sanalog.org/" target="_blank">www.sanalog.org</a> adresine bir göz atmanda fayda var! </p>
                                <p>Sanalog'u tercih ettiğin için teşekkür ederiz.</p>

                                    <h2 class="alert alert-danger">Güvenliğin için <strong>install</strong> klasörünü kaldırmalısın! </h2>
                                


                                <hr />


                                <p>
                                    <strong>Kullanıcı Adın:</strong> <span id="sadmin">sanaloger</span><br />
                                    <strong>Şifren:</strong> <span id="ssifre">admin</span>

                                </p>

                                <p class="buttons">
                                    <a href="javascript:;" class="btn btn-success btn-lg" onclick="window.location.href = '/admin';"><i class="fa fa-sitemap"></i> Yönetici Paneline Giriş</i></a>
                                    <a href="javascript:;" class="btn btn-success btn-lg" onclick="window.location.href = '/';"><i class="fa fa-home"></i> Siteye Giriş</i></a>
                                </p>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
