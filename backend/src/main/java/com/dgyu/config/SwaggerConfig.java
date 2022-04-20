package com.dgyu.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgyu.common.enums.ResultEnum;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseMessageBuilder;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.ResponseMessage;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * SwaggerConfig
 * 
 * @author dgyu
 *
 */

@Configuration
@EnableSwagger2WebMvc
public class SwaggerConfig {

	@Bean
	public Docket createRestApi() {
		// 添加全局响应状态码
		List<ResponseMessage> responseMessageList = new ArrayList<>();
		Arrays.stream(ResultEnum.values()).forEach(resultEnum -> {
			responseMessageList.add(new ResponseMessageBuilder().code(Integer.parseInt(resultEnum.getCode()))
					.message(resultEnum.getMsg()).build());
		});

		return new Docket(DocumentationType.SWAGGER_2)
				// 添加全局响应状态码
				.globalResponseMessage(RequestMethod.GET, responseMessageList)
				.globalResponseMessage(RequestMethod.POST, responseMessageList)
				.globalResponseMessage(RequestMethod.PUT, responseMessageList)
				.globalResponseMessage(RequestMethod.DELETE, responseMessageList).apiInfo(apiInfo()).select()
				.apis(RequestHandlerSelectors.basePackage("com.dgyu.controller")).paths(PathSelectors.any()).build();

	}

	private ApiInfo apiInfo() {
		return new ApiInfoBuilder().title("后台管理平台").description("后台管理平台")
				.contact(new Contact("dgyu", "dgyu@iflytek.com", "dgyu@iflytek.com")).version("1.0").build();
	}
}
