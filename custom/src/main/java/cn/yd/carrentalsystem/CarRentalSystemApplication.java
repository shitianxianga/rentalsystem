package cn.yd.carrentalsystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@MapperScan("cn.yd.carrentalsystem.mapper")
@ImportResource(value = {"classpath:dubbo-consumer.xml"})
public class CarRentalSystemApplication {

    public static void main(String[] args)
    {
        SpringApplication.run(cn.yd.carrentalsystem.CarRentalSystemApplication.class, args);
    }

}
