package com.gcy.wms.controller;

import com.gcy.wms.entity.GcyTest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/gcytest")
public class GcyTestController {

    @PostMapping("/addTest")
    public Integer addTest(@RequestBody GcyTest test){

        return null;
    }

}
