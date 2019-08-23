package cn.yd.carrentalsystem.config;

import cn.yd.carrentalsystem.config.interceptor.LoginInterceptor;
import cn.yd.carrentalsystem.config.interceptor.StateInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfigurer implements WebMvcConfigurer {
    @Autowired
    private LoginInterceptor loginInterceptor;
    @Autowired
    private StateInterceptor stateInterceptor;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor).addPathPatterns("/order/**").addPathPatterns("/user/**");
        registry.addInterceptor(stateInterceptor).addPathPatterns("/order/**");
    }
}
