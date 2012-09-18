package com.cabletech.core.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.cabletech.baseinfo.business.Service.BaseInfoProvider;
import com.cabletech.baseinfo.business.entity.UserInfo;
/**
 * SSO单点登录
 * 
 * @author Administrator
 *
 */
public class SingleSignInFilter implements Filter {
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest httpRequest = (HttpServletRequest) request;
         Object object = httpRequest.getSession().getAttribute("_const_cas_assertion_");
         
         if (object != null) {
                 Assertion assertion = (Assertion) object;
                 String loginName = assertion.getPrincipal().getName();
                 UserInfo userinfo = (UserInfo)httpRequest.getSession().getAttribute("USER");                 
                 if (userinfo == null) {
                         WebApplicationContext wct = WebApplicationContextUtils.getWebApplicationContext(httpRequest.getSession().getServletContext());
                         userinfo = new UserInfo();
                         BaseInfoProvider baseInfoProvider = (BaseInfoProvider) wct.getBean("baseInfoProvider");                         
                         userinfo = baseInfoProvider.getLoginUserService().getUserInfoByUserId(loginName);                       
                 	    httpRequest.getSession().setAttribute("USER", userinfo);
                        httpRequest.getSession().setAttribute("user", userinfo);	
                 }
         }
         chain.doFilter(request, response);
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
