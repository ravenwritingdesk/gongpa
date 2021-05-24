<%@ webhandler Language="C#" class="Upload" %>

/**
 * KindEditor ASP.NET
 *
 * 本ASP.NET程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 *
 */

using System;
using System.Collections;
using System.Web;
using System.IO;
using System.Globalization;
using LitJson;

public class Upload : IHttpHandler
{
	private HttpContext context;

	public void ProcessRequest(HttpContext context)
	{
        //登录判断
        Game.Entity.PlatformManager.Base_Users userExt = Game.Facade.AdminCookie.GetUserFromCookie();
        if (userExt == null || userExt.UserID <= 0 ||
            (userExt.UserID != Game.Entity.ApplicationConfig.SUPER_ADMINISTRATOR_ID && userExt.RoleID <= 0))
        {
           HttpContext.Current.Response.Write("请先登入。");
           return;
        }

        string aspxUrl = "http://" + HttpContext.Current.Request.Url.Authority + "";
       // String aspxUrl = context.Request.Path.Substring(0, context.Request.Path.LastIndexOf("/") + 1);
		
        string reqType=string.IsNullOrWhiteSpace(context.Request["type"])?"":context.Request["type"].ToLower();

        //文件保存目录URL
        string saveUrl = "";
		//文件保存目录路径
        string savePath = "../attached/";
        switch (reqType)
        {
            case "issue":
                savePath = "/images/Upload/Issue/";
                saveUrl = "/images/Upload/Issue/";
                break;
            case "rules":
                savePath = "/images/Upload/Rules/";
                saveUrl = "/images/Upload/Rules/";
                break;
            case "award":
                savePath = "/images/Upload/Award/";
                saveUrl = "/images/Upload/Award/";
                break;
            case "news":
                savePath = "/images/Upload/News/";
                saveUrl = "/images/Upload/News/";
                break;
            case "introduction":
                savePath = "/images/Upload/Introduction/";
                saveUrl = "/images/Upload/Introduction/";
                break;
            case "prize":
                savePath = "/images/Upload/Prize/";
                saveUrl = "/images/Upload/Prize/";
                break;
            case "articles":
                savePath = "/images/Upload/Articles/";
                saveUrl = "/images/Upload/Articles/";
                break;
            default:
                savePath = "/images/Upload/";
                saveUrl = "/images/Upload/";
                break;
        }


		//定义允许上传的文件扩展名
		Hashtable extTable = new Hashtable();
		extTable.Add("image", "gif,jpg,jpeg,png,bmp");
        //extTable.Add("flash", "swf,flv");
        //extTable.Add("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        //extTable.Add("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

		//最大文件大小
		int maxSize = 1024*5*1000;
		this.context = context;

		HttpPostedFile imgFile = context.Request.Files["imgFile"];
		if (imgFile == null)
		{
			showError("请选择文件。");
		}

        String dirPath = context.Server.MapPath(savePath);
        if (!Directory.Exists(dirPath))
        {
            Directory.CreateDirectory(dirPath);
        }


		String fileName = imgFile.FileName;
		String fileExt = Path.GetExtension(fileName).ToLower();

		if (imgFile.InputStream == null || imgFile.InputStream.Length > maxSize)
		{
			showError("上传文件大小超过限制。");
		}

        if (String.IsNullOrEmpty(fileExt) || Array.IndexOf(((String)extTable["image"]).Split(','), fileExt.Substring(1).ToLower()) == -1)
		{
            showError("上传文件扩展名是不允许的扩展名。\n只允许" + ((String)extTable["image"]) + "格式。");
		}


		String newFileName = DateTime.Now.ToString("yyyyMMddHHmmss_ffff", DateTimeFormatInfo.InvariantInfo) + fileExt;
		String filePath = dirPath + newFileName;

		imgFile.SaveAs(filePath);

        string fileUrl =  aspxUrl+saveUrl + newFileName;

		Hashtable hash = new Hashtable();
		hash["error"] = 0;
		hash["url"] = fileUrl;
		context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
		context.Response.Write(JsonMapper.ToJson(hash));
		context.Response.End();
	}

	private void showError(string message)
	{
		Hashtable hash = new Hashtable();
		hash["error"] = 1;
		hash["message"] = message;
		context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
		context.Response.Write(JsonMapper.ToJson(hash));
		context.Response.End();
	}

	public bool IsReusable
	{
		get
		{
			return true;
		}
	}
}
