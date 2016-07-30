using System;
using System.Net.Mail;
using System.Net;
using Snlg_DataBase;
using System.Data.SqlClient;
using System.Data;

public class Snlg_Mail
{
    public SmtpClient smtp = new SmtpClient();

    public void Gonder(string den, string denIsim, string kime, string konu, string mesaj)
    {
        MailMessage mail = MesajHazirla(den, denIsim, kime, konu, mesaj);
        smtp.Send(mail);
    }

    protected MailMessage MesajHazirla(string den, string denIsim, string kime, string konu, string mesaj)
    {
        MailMessage mail = new MailMessage(new MailAddress(den, denIsim), new MailAddress(kime));

        mail.IsBodyHtml = true;
        mail.Body = mesaj;
        mail.Subject = konu;
        return mail;
    }
}