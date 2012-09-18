package com.cabletech.res.service.connectmgr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import twaver.Node;

import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.cableequipmgr.GfxxEntity;
import com.cabletech.res.entity.cableequipmgr.GzdhEntity;
import com.cabletech.res.entity.opticcablemgr.GldlyEntity;
import com.cabletech.res.entity.publicmgr.OdmEntity;
import com.cabletech.res.mapper.connectmgr.ConnectMapper;
import com.cabletech.res.mapper.connectmgr.PconnectMapper;
import com.cabletech.res.service.cableequipmgr.GfxxService;
import com.cabletech.res.service.cableequipmgr.GzdhService;
import com.cabletech.res.service.opticcablemgr.GldlyService;
import com.cabletech.res.service.publicmgr.OdmService;

/**
 * 批量连接管理Action(成端、跳纤、熔纤)
 * 
 * @author Lv Renzhao 2012-06-27
 */
@Service
public class PconnectServiceImpl extends BaseServiceImpl implements
		PconnectService {

	@Resource(name = "pconnectMapper")
	private PconnectMapper pconnectMapper;
	@Resource(name = "connectMapper")
	private ConnectMapper connectMapper;

	@Resource(name = "connectServiceImpl")
	private ConnectService connectService;

	@Resource(name = "odmServiceImpl")
	// ODM
	private OdmService odmservice;
	@Resource(name = "gfxxServiceImpl")
	// 光分
	private GfxxService gfxxService;
	@Resource(name = "gzdhServiceImpl")
	// 终端盒
	private GzdhService gzdhservice;
	@Resource(name = "gldlyServiceImpl")
	// 光缆段
	private GldlyService gldlyservice;

	public List<Map<String, Object>> getBH(String xtbh, String zylx,
			String tid, String ttype) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		if ("AD703".equals(zylx)) {
			OdmEntity odm = odmservice.getbyid(xtbh);
			params.put("parenttype", odm.getSssblx());
			return pconnectMapper.getODMPorts(params);
		} else if ("AA004".equals(zylx)) {
			return pconnectMapper.getGFXXPorts(params);
		} else if ("AA006".equals(zylx)) {
			return pconnectMapper.getGZDHPorts(params);
		} else if ("A33".equals(zylx)) {
			List<Map<String, Object>> bhs = new ArrayList<Map<String, Object>>();
			GldlyEntity gldly = gldlyservice.getbyid(xtbh);
			params = new HashMap<String, Object>();
			params.put("xtbh", xtbh);
			params.put("topid", tid);
			params.put("toptype", ttype);
			List<String> lineNos = connectMapper.getUsedLines(params);
			int xxs = 0;
			try {
				xxs = Integer.parseInt(gldly.getXxs());
			} catch (Exception ex) {
			}
			int xno = 1;
			for (int x = 0; x < xxs; x++) {
				Map<String, Object> bh = new HashMap<String, Object>();
				bh.put("ID", xno);
				bh.put("RN", xno);
				if (lineNos.contains(String.valueOf(xno))) {
					bh.put("STATE", "占用");
				} else {
					bh.put("STATE", "空闲");
				}
				xno++;
				bhs.add(bh);
			}

			return bhs;
		}
		return null;
	}

	public String getZYMC(String xtbh, String zylx) {
		if ("AD703".equals(zylx)) {
			OdmEntity odm = odmservice.getbyid(xtbh);
			if (odm != null) {
				return odm.getZymc();
			}
		} else if ("AA004".equals(zylx)) {
			GfxxEntity gfxx = gfxxService.view(xtbh);
			if (gfxx != null) {
				return gfxx.getZymc();
			}
		} else if ("AA006".equals(zylx)) {
			GzdhEntity gzdh = gzdhservice.getbyid(xtbh);
			if (gzdh != null) {
				return gzdh.getZymc();
			}
		} else if ("A33".equals(zylx)) {
			GldlyEntity gldly = gldlyservice.getbyid(xtbh);
			if (gldly != null) {
				return gldly.getZymc();
			}
		}
		return "";
	}

	@Override
	public void save(String lid, String ltype, String rid, String rtype,
			String tid, String ttype, String lS, String lE, String rS, String rE) {
		List<Map<String, Object>> l_bhs = getBH(lid, ltype, tid, ttype, lS, lE);
		List<Map<String, Object>> r_bhs = getBH(rid, rtype, tid, ttype, rS, rE);
		if ("AD703".equals(ltype)) {
			OdmEntity odm = odmservice.getbyid(lid);
			if(odm!=null){
				lid = odm.getSssb();
				ltype = odm.getSssblx();
			}
		}
		if ("AD703".equals(rtype)) {
			OdmEntity odm = odmservice.getbyid(rid);
			if(odm!=null){
				rid = odm.getSssb();
				rtype = odm.getSssblx();
			}
		}
		if ((l_bhs != null && r_bhs != null) && (l_bhs.size() == r_bhs.size())) {
			if (ltype.equals("A33") && rtype.equals("A33")) {
				// 熔纤
				for (int i = 0; i < l_bhs.size(); i++) {
					String a_mc = String.valueOf(l_bhs.get(i).get("ID"));
					String z_mc = String.valueOf(r_bhs.get(i).get("ID"));
					connectService.insertLineConnect(tid, ttype, lid, a_mc,
							rid, z_mc);
				}

			} else if (ltype.equals("A33") || rtype.equals("A33")) {
				// 成端
				for (int i = 0; i < l_bhs.size(); i++) {
					String a_mc = String.valueOf(l_bhs.get(i).get("ID"));
					String z_mc = String.valueOf(r_bhs.get(i).get("ID"));
					connectService.insertPortConnect(lid, ltype, a_mc, rid,
							rtype, z_mc, "AA203");
				}
			} else {
				// 跳纤
				for (int i = 0; i < l_bhs.size(); i++) {
					String a_mc = String.valueOf(l_bhs.get(i).get("ID"));
					String z_mc = String.valueOf(r_bhs.get(i).get("ID"));
					connectService.insertPortConnect(lid, ltype, a_mc, rid,
							rtype, z_mc, "AA201");
				}
			}
		}
	}

	private List<Map<String, Object>> getBH(String xtbh, String zylx,
			String tid, String ttype, String start, String end) {
		List<Map<String, Object>> bhs = new ArrayList<Map<String, Object>>();

		List<Map<String, Object>> bhs_all = new ArrayList<Map<String, Object>>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		if ("AD703".equals(zylx)) {
			OdmEntity odm = odmservice.getbyid(xtbh);
			params.put("parenttype", odm.getSssblx());
			bhs_all = pconnectMapper.getODMPorts(params);
		} else if ("AA004".equals(zylx)) {
			bhs_all = pconnectMapper.getGFXXPorts(params);
		} else if ("AA006".equals(zylx)) {
			bhs_all = pconnectMapper.getGZDHPorts(params);
		} else if ("A33".equals(zylx)) {
			int s = 0;
			int e = 0;
			try {
				s = Integer.parseInt(start);
				e = Integer.parseInt(end);
			} catch (Exception ex) {
			}
			for (int x = s; x <= e; x++) {
				Map<String, Object> bh = new HashMap<String, Object>();
				bh.put("ID", x);
				bhs.add(bh);
			}
			return bhs;
		}
		boolean ifAdd = false;
		for (int i = 0; bhs_all != null && i < bhs_all.size(); i++) {
			String port = String.valueOf(bhs_all.get(i).get("ID"));
			if (StringUtils.isNotBlank(port) && port.equals(start)) {
				ifAdd = true;
			}
			if (ifAdd) {
				bhs.add(bhs_all.get(i));
			}
			if (StringUtils.isNotBlank(port) && port.equals(end)) {
				ifAdd = false;
			}
		}
		return bhs;
	}

}
