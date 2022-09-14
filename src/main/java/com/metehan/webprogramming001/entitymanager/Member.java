package com.metehan.webprogramming001.entitymanager;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {

    private long memberId;
    private String memberName;
    private String memberPassword;

}
