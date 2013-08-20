package org.apache.jsp.WEB_002dINF.layouts;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminDefault_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(2);
    _jspx_dependants.add("/WEB-INF/layouts/adminHeader.jsp");
    _jspx_dependants.add("/WEB-INF/layouts/adminLeft.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_set_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_set_var_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      if (_jspx_meth_c_set_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <title>Mobile first web app theme | first</title>\n");
      out.write("    <meta name=\"description\" content=\"mobile first, app, web app, responsive, admin dashboard, flat, flat ui\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/styles/backend/app.v3.css\">\n");
      out.write("    <!--[if lt IE 9]> <script src=\"http://cdn.staticfile.org/respond.js/1.2.0/respond.min.js\"></script> <script src=\"http://cdn.staticfile.org/html5shiv/r29/html5.min.js\"></script> <script src=\"js/ie/excanvas.js\"></script> <![endif]-->\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<style type=\"text/css\">\n");
      out.write("    .navbar-brand{\n");
      out.write("        color: #3c3c3c;\n");
      out.write("        padding-left: 10px;\n");
      out.write("        padding-right: 20px;\n");
      out.write("    }\n");
      out.write("</style>\n");
      out.write("<!-- header -->\n");
      out.write("<header id=\"header\" class=\"navbar\">\n");
      out.write("    <ul class=\"nav navbar-nav navbar-avatar pull-right\">\n");
      out.write("        <li class=\"dropdown\">\n");
      out.write("            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\n");
      out.write("                <span class=\"hidden-xs-only\"><i class=\"icon-user\"></i>你好，管理员</span>\n");
      out.write("                    <span class=\"thumb-small avatar inline\">\n");
      out.write("                        <img src=\"images/avatar.jpg\" alt=\"Mika Sokeil\" class=\"img-circle\">\n");
      out.write("                    </span> <b class=\"caret hidden-xs-only\"></b>\n");
      out.write("            </a>\n");
      out.write("            <ul class=\"dropdown-menu\">\n");
      out.write("                <li><a href=\"#\">个人资料</a></li>\n");
      out.write("                <li class=\"divider\">\n");
      out.write("                <li><a href=\"signin.html\">退出</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>\n");
      out.write("    </ul><a class=\"navbar-brand\" href=\"#\">食享家后台管理系统</a>\n");
      out.write("    <button type=\"button\" class=\"btn btn-link pull-left nav-toggle visible-xs\" data-toggle=\"class:slide-nav slide-nav-left\" data-target=\"body\"> <i class=\"icon-reorder icon-xlarge text-default\"></i>\n");
      out.write("    </button>\n");
      out.write("</header>\n");
      out.write("<!-- / header -->");
      out.write('\n');
      out.write("\n");
      out.write("<!-- nav -->\n");
      out.write("<nav id=\"nav\" class=\"nav-primary hidden-xs nav-vertical\">\n");
      out.write("    <ul class=\"nav\" data-spy=\"affix\" data-offset-top=\"50\">\n");
      out.write("        <li class=\"active\"><a href=\"index.html\"><i class=\"icon-dashboard icon-xlarge\"></i><span>控制面板</span></a>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"dropdown-submenu\"><a href=\"#\"><i class=\"icon-th icon-xlarge\"></i><span>栏目管理</span></a>\n");
      out.write("            <ul class=\"dropdown-menu\">\n");
      out.write("                <li><a href=\"buttons.html\">新增栏目</a></li>\n");
      out.write("                <li><a href=\"icons.html\">栏目列表</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"dropdown-submenu\"><a href=\"#\"><i class=\"icon-shopping-cart icon-xlarge\"></i><span>产品管理</span></a>\n");
      out.write("            <ul class=\"dropdown-menu\">\n");
      out.write("                <li><a href=\"list.html\">新增产品</a>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"table.html\">产品列表</a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"dropdown-submenu\"><a href=\"#\"><i class=\"icon-th-list icon-xlarge\"></i><span>文章管理</span></a>\n");
      out.write("            <ul class=\"dropdown-menu\">\n");
      out.write("                <li><a href=\"mail.html\">新增文章</a></li>\n");
      out.write("                <li><a href=\"calendar.html\">文章列表</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </li>\n");
      out.write("    </ul>\n");
      out.write("</nav>\n");
      out.write("<!-- / nav -->");
      out.write("\n");
      out.write("<section class=\"main padder\" id=\"content\">\n");
      out.write("    <div class=\"row\">\n");
      out.write("        <div class=\"col-lg-6\">\n");
      out.write("            <!-- scrollable inbox widget -->\n");
      out.write("            <section class=\"panel\">\n");
      out.write("                <header class=\"panel-heading\">合作伙伴</header>\n");
      out.write("                <section style=\"height:210px\" class=\"panel-body scrollbar scroll-y m-b\">\n");
      out.write("                    <article class=\"media\">\n");
      out.write("                                <span class=\"pull-left thumb-small\">\n");
      out.write("                                    <img src=\"images/avatar.jpg\" alt=\"John said\" class=\"img-circle\">\n");
      out.write("                                </span>\n");
      out.write("                        <div class=\"media-body\">\n");
      out.write("                            <div class=\"pull-right media-mini text-center text-muted\">\n");
      out.write("                                <strong class=\"h4\">12:18</strong>\n");
      out.write("                                <br>\n");
      out.write("                                <small class=\"label bg-light\">pm</small>\n");
      out.write("                            </div> <a href=\"#\" class=\"h4\">Bootstrap 3.0 is comming</a>\n");
      out.write("                            <small class=\"block\"><a href=\"#\" class=\"\">John Smith</a>\n");
      out.write("                                <span class=\"label label-success\">Circle</span>\n");
      out.write("                            </small>\n");
      out.write("                            <small class=\"block\">Sleek, intuitive, and powerful mobile-first front-end framework for faster and easier web development.</small>\n");
      out.write("                        </div>\n");
      out.write("                    </article>\n");
      out.write("                    <div class=\"line pull-in\"></div>\n");
      out.write("                    <article class=\"media\">\n");
      out.write("                                <span class=\"pull-left thumb-small\"><i class=\"icon-user icon-2x text-muted\"></i>\n");
      out.write("                                </span>\n");
      out.write("                        <div class=\"media-body\">\n");
      out.write("                            <div class=\"pull-right media-mini text-center text-muted\">\n");
      out.write("                                <strong class=\"h4\">17</strong>\n");
      out.write("                                <br>\n");
      out.write("                                <small class=\"label bg-light\">feb</small>\n");
      out.write("                            </div> <a href=\"#\" class=\"h4\">Bootstrap documents</a>\n");
      out.write("                            <small class=\"block\"><a href=\"#\" class=\"\">John Smith</a>\n");
      out.write("                                <span class=\"label label-info\">Friends</span>\n");
      out.write("                            </small>\n");
      out.write("                            <small class=\"block\">There are a few easy ways to quickly get started with Bootstrap, each one appealing to a different skill level and use case. Read through to see what suits your particular needs.</small>\n");
      out.write("                        </div>\n");
      out.write("                    </article>\n");
      out.write("                    <div class=\"line pull-in\"></div>\n");
      out.write("                    <article class=\"media\">\n");
      out.write("                        <div class=\"media-body\">\n");
      out.write("                            <div class=\"pull-right media-mini text-center text-muted\">\n");
      out.write("                                <strong class=\"h4\">09</strong>\n");
      out.write("                                <br>\n");
      out.write("                                <small class=\"label bg-light\">jan</small>\n");
      out.write("                            </div> <a href=\"#\" class=\"h4 text-success\">Mobile first html/css framework</a>\n");
      out.write("                            <small class=\"block\">Bootstrap, Ratchet</small>\n");
      out.write("                        </div>\n");
      out.write("                    </article>\n");
      out.write("                </section>\n");
      out.write("            </section>\n");
      out.write("            <!-- / scrollable inbox widget-->\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-lg-6\">\n");
      out.write("            <!-- task -->\n");
      out.write("            <section class=\"panel\">\n");
      out.write("                <header class=\"panel-heading\">品牌故事</header>\n");
      out.write("                <ul class=\"list-group\">\n");
      out.write("                    <li class=\"list-group-item\" data-toggle=\"class:active\" data-target=\"#todo-1\">\n");
      out.write("                        <div class=\"media\">\n");
      out.write("                                    <span class=\"pull-left thumb-small m-t-mini\"> <i class=\"icon-code icon-xlarge text-default\"></i>\n");
      out.write("                                    </span>\n");
      out.write("                            <div id=\"todo-1\" class=\"pull-right text-primary m-t-small\"> <i class=\"icon-circle icon-large text text-default\"></i>  <i class=\"icon-ok-sign icon-large text-active text-primary\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"media-body\">\n");
      out.write("                                <div><a href=\"#\" class=\"h5\">Coding on app</a>\n");
      out.write("                                </div>\n");
      out.write("                                <small class=\"text-muted\">9:30 am every day</small>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"list-group-item bg\" data-toggle=\"class:active\" data-target=\"#todo-2\">\n");
      out.write("                        <div class=\"media\">\n");
      out.write("                                    <span class=\"pull-left thumb-small m-t-mini\"> <i class=\"icon-reply icon-xlarge text-default\"></i>\n");
      out.write("                                    </span>\n");
      out.write("                            <div id=\"todo-2\" class=\"pull-right text-primary m-t-small\"> <i class=\"icon-circle icon-large text text-default\"></i>  <i class=\"icon-ok-sign icon-large text-active text-primary\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"media-body\">\n");
      out.write("                                <div><a href=\"#\" class=\"h5\">Reply email</a>\n");
      out.write("                                </div>\n");
      out.write("                                <small class=\"text-muted\">Check Gmail and reply</small>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"list-group-item\" data-toggle=\"class:active\" data-target=\"#todo-3\">\n");
      out.write("                        <div class=\"media\">\n");
      out.write("                                    <span class=\"pull-left thumb-small m-t-mini\"> <i class=\"icon-coffee icon-xlarge text-default\"></i>\n");
      out.write("                                    </span>\n");
      out.write("                            <div id=\"todo-3\" class=\"pull-right text-primary m-t-small\"> <i class=\"icon-circle icon-large text text-default\"></i>  <i class=\"icon-ok-sign icon-large text-active text-primary\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"media-body\">\n");
      out.write("                                <div><a href=\"#\" class=\"h5\">Coffee time</a>\n");
      out.write("                                </div>\n");
      out.write("                                <small class=\"text-muted\">Freetime as you want</small>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"list-group-item bg\" data-toggle=\"class:active\" data-target=\"#todo-4\">\n");
      out.write("                        <div class=\"media\">\n");
      out.write("                                    <span class=\"pull-left thumb-small m-t-mini\"> <i class=\"icon-music icon-xlarge text-default\"></i>\n");
      out.write("                                    </span>\n");
      out.write("                            <div id=\"todo-4\" class=\"pull-right text-primary m-t-small\"> <i class=\"icon-circle icon-large text text-default\"></i>  <i class=\"icon-ok-sign icon-large text-active text-primary\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"media-body\">\n");
      out.write("                                <div><a href=\"#\" class=\"h5\">Listen music</a>\n");
      out.write("                                </div>\n");
      out.write("                                <small class=\"text-muted\">Listening and finding</small>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </section>\n");
      out.write("            <!-- / task-->\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/static/script/backend/app.v3.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_set_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_0.setPageContext(_jspx_page_context);
    _jspx_th_c_set_0.setParent(null);
    _jspx_th_c_set_0.setVar("ctx");
    _jspx_th_c_set_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_0 = _jspx_th_c_set_0.doStartTag();
    if (_jspx_th_c_set_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
    return false;
  }
}
