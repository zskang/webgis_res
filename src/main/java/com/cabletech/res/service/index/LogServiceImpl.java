package com.cabletech.res.service.index;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.mapper.index.LogMapper;

/**
 * 日志操作
 * 
 * @author 吕仁钊 2012-08-11
 * 
 */
@Service
public class LogServiceImpl extends BaseServiceImpl implements LogService {

	@Resource(name = "logMapper")
	private LogMapper logMapper;

	
}
