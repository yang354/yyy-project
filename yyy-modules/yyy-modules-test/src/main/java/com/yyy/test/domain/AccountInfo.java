package com.yyy.test.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;

import java.io.Serializable;

/*
为了测试多数据源，引入了bank1的一张表
 */

@Data
public class AccountInfo implements Serializable {

	private Long id;
	private String accountName;
	private String accountNo;
	private String accountPassword;
	private Double accountBalance;
	

}
