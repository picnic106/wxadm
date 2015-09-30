package com.yaolan.wxacm.web.service;

import com.yaolan.wxacm.core.generic.GenericService;
import com.yaolan.wxacm.web.model.Wxac;

import java.util.List;
import java.util.Map;

/**
 * Created by Yaolan on 2015/8/12.
 */
public interface WxacService extends GenericService<Wxac, Long> {
  int savePzAc(Long acid,Long pzid);

  int updateStats(Integer stats,Integer acid);

  int deleteByFKey(Long id,Long pzid);

  List<Map<String,Object>> selectSignUpUsers(Long acid);

  List<Map<String,Object>> selectCharts(Long acid);

}
