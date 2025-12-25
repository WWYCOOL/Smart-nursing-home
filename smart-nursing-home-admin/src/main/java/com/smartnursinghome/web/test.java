package com.smartnursinghome.web;

import com.smartnursinghome.common.utils.SecurityUtils;

public class test {
    public static void main(String[] args) {
        System.out.println(SecurityUtils.encryptPassword("admin"));
    }
}
