package com.zyd.shiro.framework.filter;


import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * @author mojiayi
 * @date 2019-07-31 11:24
 */
public class CustomFilter extends AuthorizationFilter {
    private static final Logger logger = LoggerFactory.getLogger(AuthorizationFilter.class);

    String name ;

    public CustomFilter(String name) {
        this.name = name;
    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {



            logger.error("account need login for: {}",  ((HttpServletRequest)request).getServletPath());

        logger.error("$$$$$$$$$$$$$$$$$$$$$$$$$$$$:"+name+"----"+((HttpServletRequest) request).getRequestURI()+""+((HttpServletRequest) request).getPathInfo());
        // 请求被拦截后直接返回json格式的响应数据

        return true;
    }
}
