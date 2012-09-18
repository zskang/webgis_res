package com.cabletech.res.service.connectmgr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import twaver.Consts;
import twaver.ElementBox;
import twaver.Link;
import twaver.Node;
import twaver.SerializationSettings;
import twaver.Styles;
import twaver.XMLSerializer;

import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.cableequipmgr.GfxxEntity;
import com.cabletech.res.entity.cableequipmgr.GjjxEntity;
import com.cabletech.res.entity.cableequipmgr.GzdhEntity;
import com.cabletech.res.entity.connectmgr.PortEntity;
import com.cabletech.res.entity.opticcablemgr.GldlyEntity;
import com.cabletech.res.entity.publicmgr.OdfEntity;
import com.cabletech.res.entity.publicmgr.OdmEntity;
import com.cabletech.res.mapper.connectmgr.ConnectMapper;
import com.cabletech.res.service.cableequipmgr.GfxxService;
import com.cabletech.res.service.cableequipmgr.GjjxService;
import com.cabletech.res.service.cableequipmgr.GjtService;
import com.cabletech.res.service.cableequipmgr.GzdhService;
import com.cabletech.res.service.opticcablemgr.GldlyService;
import com.cabletech.res.service.publicmgr.JfxxService;
import com.cabletech.res.service.publicmgr.OdfService;
import com.cabletech.res.service.publicmgr.OdmService;

/**
 * 连接管理Action(成端、跳纤、熔纤)
 * 
 * @author Lv Renzhao 2012-06-27
 */
@Service
public class ConnectServiceImpl extends BaseServiceImpl implements
		ConnectService {
	@Resource(name = "connectMapper")
	private ConnectMapper connectMapper;
	/**
	 * 组合设备面板
	 * 
	 * @param _leftId
	 *            左边的设备ID
	 * @param _leftType
	 *            左边的设备类型
	 * @param _rightId
	 *            右边的设备ID
	 * @param _rightType
	 *            右边的设备类型
	 * @return 将结构序列化成XML字符串返回给客户端,Twaver解析XML字符串并生成拓扑
	 */
	public String constructPanel(String _leftId, String _leftType, String _rightId, String _rightType,String _topId,String topType) {
		String width = initPanel(_leftId,_leftType);
		initPanel(_rightId,_rightType);
		ElementBox box = new ElementBox();
		SerializationSettings.registerGlobalClient("status", "String", true,true);
		SerializationSettings.registerGlobalClient("xtbh", "String", true,true);
		SerializationSettings.registerGlobalClient("zylx", "String", true,true);
		List<Node> lst_left_nodes = getNodes(_leftId,_leftType,_topId,topType);
		for(int i =0 ; lst_left_nodes!= null && i<lst_left_nodes.size();i++){
			box.add(lst_left_nodes.get(i));
		}
		List<Node> lst_right_nodes = getNodes(_rightId,_rightType,_topId,topType);
		for(int i =0 ; lst_right_nodes!= null && i<lst_right_nodes.size();i++){
			lst_right_nodes.get(i).setLocation(lst_right_nodes.get(i).getX()+Integer.parseInt(width)+10,lst_right_nodes.get(i).getY());
			box.add(lst_right_nodes.get(i));
		}
		String str = serialize(box);
		return str;
	}
	
	private String initPanel(String xtbh, String zylx){
		if(StringUtils.isBlank(xtbh) || StringUtils.isBlank(zylx)){
			return "0";
		}
		//如果是光缆段
		if(zylx.equals("A33")){
			return getWidthByLineId(xtbh);
		}
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		OdmEntity odm = null;
		if(zylx.equals("AD703")){
			odm = odmservice.getbyid(xtbh);
			params.put("parenttype", odm.getSssblx());
			params.put("parentid", odm.getSssb());
		}
		if(connectMapper.ifHasPorts(params).equals("0")){
			//这里生成端子
			if(zylx.equals("AD703")){
				createPorts(odm.getSssb(),odm.getSssblx());
			}else{
				createPorts(xtbh,zylx);
			}
		}
		String width = connectMapper.getDeviceWidth(params);
		if(!StringUtils.isNumeric(width)){
			return "0";
		}
		return width;
	}
	
	/**
	 * 生成端子
	 * @param xtbh
	 * @param zylx
	 */
	private void createPorts(String xtbh, String zylx){
		//odf面板绘制
		if(zylx.equals("AA001")){
			OdfEntity odf = odfservice.getbyid(xtbh);
			List<OdmEntity> odms = odmservice.getByParentId(xtbh, zylx);
			int panels = 2; //面数(A\B)
			int roworcol = 0;//行数或列数，行优时为行数，列优时为列数。
			int colorrow = 0;//行数或列数，行优时为列数，列优时为行数。
			try{
				if(StringUtils.isNotBlank(odf.getKphgz()) && odf.getKphgz().equals("AE602")){
					roworcol = Integer.parseInt(odf.getOdmhls());//列优
					colorrow = Integer.parseInt(odf.getOdmkhs());
				}else{
					roworcol = Integer.parseInt(odf.getOdmkhs());//行优
					colorrow = Integer.parseInt(odf.getOdmhls());
				}
			}
			catch(Exception ex){}
			String hplfs = odf.getKhplfs();
			String lplfs = odf.getKlplfs();
			int odf_width=0;
			int odf_height=30;
			//开始遍历odf面板、odm框
			for(int p = 0;p<panels;p++){
				int kh = 1;//框号
				int odf_panel_width = odf_width+DEFAULT_AB_PADDING_TOPBOTTOM;
				int odf_p_x = odf_width+DEFAULT_AB_PADDING_TOPBOTTOM;
				int odf_p_y = 30;
				int odm_width = 0;
				int odm_height = 0;
				for(int r = 0;r<roworcol;r++){
					if(StringUtils.isNotBlank(odf.getKphgz()) && odf.getKphgz().equals("AE602")){
						odm_width = getMaxColumnWidth(colorrow,roworcol,p,odf.getKphgz(),odf.getXtbh(),r);
						odf_width += odm_width+DEFAULT_AB_PADDING_TOPBOTTOM;
					}else{
						odm_height = getMaxRowHeight(roworcol,colorrow,p,odf.getKphgz(),odf.getXtbh(),r);
						odf_height += (odm_height + DEFAULT_ODM_PADDING_TOPBOTTOM);
					}
					for(int c = 0;c<colorrow;c++){
						if(StringUtils.isNotBlank(odf.getKphgz()) && odf.getKphgz().equals("AE602")){
							odm_height = getMaxRowHeight(colorrow,roworcol,p,odf.getKphgz(),odf.getXtbh(),c);
							if(r == 0){
								odf_height += (odm_height + DEFAULT_ODM_PADDING_TOPBOTTOM);
							}
						}else{
							odm_width = getMaxColumnWidth(roworcol,colorrow,p,odf.getKphgz(),odf.getXtbh(),c);
							if(r == 0){
								odf_width += odm_width+DEFAULT_AB_PADDING_TOPBOTTOM;
							}
						}
						OdmEntity odm = getODM(odms,p,kh);
						if(odm!=null && StringUtils.isNotBlank(odm.getXtbh())){
							odm.setTwwidth(String.valueOf(odm_width));
							odm.setTwheight(String.valueOf(odm_height));
							odm.setTwx(String.valueOf(odf_p_x));
							odm.setTwy(String.valueOf(odf_p_y));
							if(odm.getBplfs() != null && (odm.getBplfs().equals("AD001") || odm.getBplfs().equals("AD006"))){
								odm.setTwplfs("1");
							}else{
								odm.setTwplfs("0");
							}
							odmservice.saveorupdate(odm);
							//根据odm生成端子
							int bdys = 0;
							int ports = 0;
							int startNo = 0;
							try{
								bdys = Integer.parseInt(odm.getDybs());
								ports = Integer.parseInt(odm.getBdzs());
								startNo = Integer.parseInt(odm.getDzqsbh());
							}catch(Exception ex){}
							PortEntity pentity =null;
							int port_x = odf_p_x;
							int port_y = odf_p_y;
							for(int b = 0;b<bdys;b++){
								if(odm.getTwplfs().equals("0")){
									if(b==0){
										port_x += DEFAULT_PORT_PADDING;
									}else{
										port_x += 10+DEFAULT_PORT_PADDING;
									}
									port_y = odf_p_y+DEFAULT_PORT_PADDING+8;
								}else{
									if(b==0){
										port_y += DEFAULT_PORT_PADDING;
									}
									else{
										port_y += 10+DEFAULT_PORT_PADDING;
									}
									port_x = odf_p_x+DEFAULT_PORT_PADDING+8;
								}
								for(int po=startNo;po<ports+startNo;po++){
									pentity = new PortEntity();
									pentity.setXtbh(mapper.getXTBH());
									pentity.setTwx(String.valueOf(port_x));
									pentity.setTwy(String.valueOf(port_y));
									pentity.setSssb(odf.getXtbh());
									pentity.setSsodm(odm.getXtbh());
									String portName =null;
									if(b<24){
										portName= ((p == 0)?"A":"B")+"-"+kh+"-"+UNITS[b]+"-"+po; 
									}
									pentity.setPortname(portName);
									pentity.setDzbh(String.valueOf(po));
									if(portName != null){
										savePort(pentity,zylx);
									}
									if(odm.getTwplfs().equals("0")){
										port_y += DEFAULT_PORT_PADDING+10;
									}else{
										port_x += DEFAULT_PORT_PADDING+10;
									}
								}
							}
						}
						if(StringUtils.isNotBlank(odf.getKphgz()) && odf.getKphgz().equals("AE602")){
							//列优
							if(StringUtils.isNotBlank(lplfs) && lplfs.equals("AD005")){
								odf_p_y -= (odm_height+DEFAULT_ODM_PADDING_TOPBOTTOM);
							}else{
								odf_p_y += (odm_height+DEFAULT_ODM_PADDING_TOPBOTTOM);
							}
						}else{
							if(StringUtils.isNotBlank(hplfs) && hplfs.equals("AD001")){
								odf_p_x -= odm_width;
							}else{
								odf_p_x += odm_width;
							}
						}
						kh++;
					}
					if(StringUtils.isNotBlank(odf.getKphgz()) && odf.getKphgz().equals("AE602")){
						odf_p_y = 30; 
						if(StringUtils.isNotBlank(hplfs) && hplfs.equals("AD001")){
							odf_p_x -= odm_width;
						}else{
							odf_p_x += odm_width;
						}
					}else{
						odf_p_x = odf_panel_width;
						if(StringUtils.isNotBlank(lplfs) && lplfs.equals("AD005")){
							odf_p_y -= (odm_height+DEFAULT_ODM_PADDING_TOPBOTTOM);
						}else{
							odf_p_y += (odm_height+DEFAULT_ODM_PADDING_TOPBOTTOM);
						}
					}
				}
				if(p == 0){
					odf.setTwwidth(String.valueOf(odf_width));
					odf.setTwheight(String.valueOf(odf_height));
					odf.setTwx("0");
					odf.setTwy("0");
					odfservice.saveorupdate(odf);
				}
			}
		}
		//光交接箱面板绘制
		else if(zylx.equals("AA003")){
			GjjxEntity gjjx = gjjxService.view(xtbh);
			List<OdmEntity> odms = odmservice.getByParentId(xtbh, zylx);
			int panels = 2; //面数(A\B)
			int roworcol = 0;//行数或列数，行优时为行数，列优时为列数。
			int colorrow = 0;//行数或列数，行优时为列数，列优时为行数。
			try{
				if(StringUtils.isNotBlank(gjjx.getKphgz()) && gjjx.getKphgz().equals("AE602")){
					roworcol = Integer.parseInt(gjjx.getOdmkls());//列优
					colorrow = Integer.parseInt(gjjx.getOdmkhs());
				}else{
					roworcol = Integer.parseInt(gjjx.getOdmkhs());//行优
					colorrow = Integer.parseInt(gjjx.getOdmkls());
				}
			}
			catch(Exception ex){}
			String hplfs = gjjx.getKhplfs();
			String lplfs = gjjx.getKlplfs();
			int odf_width=0;
			int odf_height=30;
			//开始遍历odf面板、odm框
			for(int p = 0;p<panels;p++){
				int kh = 1;//框号
				int odf_panel_width = odf_width+DEFAULT_AB_PADDING_TOPBOTTOM;
				int odf_p_x = odf_width+DEFAULT_AB_PADDING_TOPBOTTOM;
				int odf_p_y = 30;
				int odm_width = 0;
				int odm_height = 0;
				for(int r = 0;r<roworcol;r++){
					if(StringUtils.isNotBlank(gjjx.getKphgz()) && gjjx.getKphgz().equals("AE602")){
						odm_width = getMaxColumnWidth(colorrow,roworcol,p,gjjx.getKphgz(),gjjx.getXtbh(),r);
						odf_width += odm_width+DEFAULT_AB_PADDING_TOPBOTTOM;
					}else{
						odm_height = getMaxRowHeight(roworcol,colorrow,p,gjjx.getKphgz(),gjjx.getXtbh(),r);
						odf_height += (odm_height + DEFAULT_ODM_PADDING_TOPBOTTOM);
					}
					for(int c = 0;c<colorrow;c++){
						if(StringUtils.isNotBlank(gjjx.getKphgz()) && gjjx.getKphgz().equals("AE602")){
							odm_height = getMaxRowHeight(colorrow,roworcol,p,gjjx.getKphgz(),gjjx.getXtbh(),c);
							if(r == 0){
								odf_height += (odm_height + DEFAULT_ODM_PADDING_TOPBOTTOM);
							}
						}else{
							odm_width = getMaxColumnWidth(roworcol,colorrow,p,gjjx.getKphgz(),gjjx.getXtbh(),c);
							if(r == 0){
								odf_width += odm_width+DEFAULT_AB_PADDING_TOPBOTTOM;
							}
						}
						OdmEntity odm = getODM(odms,p,kh);
						if(odm!=null && StringUtils.isNotBlank(odm.getXtbh())){
							odm.setTwwidth(String.valueOf(odm_width));
							odm.setTwheight(String.valueOf(odm_height));
							odm.setTwx(String.valueOf(odf_p_x));
							odm.setTwy(String.valueOf(odf_p_y));
							if(odm.getBplfs() != null && (odm.getBplfs().equals("AD001") || odm.getBplfs().equals("AD006"))){
								odm.setTwplfs("1");
							}else{
								odm.setTwplfs("0");
							}
							odmservice.saveorupdate(odm);
							//根据odm生成端子
							int bdys = 0;
							int ports = 0;
							int startNo = 0;
							try{
								bdys = Integer.parseInt(odm.getDybs());
								ports = Integer.parseInt(odm.getBdzs());
								startNo = Integer.parseInt(odm.getDzqsbh());
							}catch(Exception ex){}
							PortEntity pentity =null;
							int port_x = odf_p_x;
							int port_y = odf_p_y;
							for(int b = 0;b<bdys;b++){
								if(odm.getTwplfs().equals("0")){
									if(b==0){
										port_x += DEFAULT_PORT_PADDING;
									}else{
										port_x += 10+DEFAULT_PORT_PADDING;
									}
									port_y = odf_p_y+DEFAULT_PORT_PADDING+8;
								}else{
									if(b==0){
										port_y += DEFAULT_PORT_PADDING;
									}
									else{
										port_y += 10+DEFAULT_PORT_PADDING;
									}
									port_x = odf_p_x+DEFAULT_PORT_PADDING+8;
								}
								for(int po=startNo;po<ports+startNo;po++){
									pentity = new PortEntity();
									pentity.setXtbh(mapper.getXTBH());
									pentity.setTwx(String.valueOf(port_x));
									pentity.setTwy(String.valueOf(port_y));
									pentity.setSssb(gjjx.getXtbh());
									pentity.setSsodm(odm.getXtbh());
									String portName =null;
									if(b<24){
										portName= ((p == 0)?"A":"B")+"-"+kh+"-"+UNITS[b]+"-"+po; 
									}
									pentity.setPortname(portName);
									pentity.setDzbh(String.valueOf(po));
									if(portName != null){
										savePort(pentity,zylx);
									}
									if(odm.getTwplfs().equals("0")){
										port_y += DEFAULT_PORT_PADDING+10;
									}else{
										port_x += DEFAULT_PORT_PADDING+10;
									}
								}
							}
						}
						if(StringUtils.isNotBlank(gjjx.getKphgz()) && gjjx.getKphgz().equals("AE602")){
							//列优
							if(StringUtils.isNotBlank(lplfs) && lplfs.equals("AD005")){
								odf_p_y -= (odm_height+DEFAULT_ODM_PADDING_TOPBOTTOM);
							}else{
								odf_p_y += (odm_height+DEFAULT_ODM_PADDING_TOPBOTTOM);
							}
						}else{
							if(StringUtils.isNotBlank(hplfs) && hplfs.equals("AD001")){
								odf_p_x -= odm_width;
							}else{
								odf_p_x += odm_width;
							}
						}
						kh++;
					}
					if(StringUtils.isNotBlank(gjjx.getKphgz()) && gjjx.getKphgz().equals("AE602")){
						odf_p_y = 30; 
						if(StringUtils.isNotBlank(hplfs) && hplfs.equals("AD001")){
							odf_p_x -= odm_width;
						}else{
							odf_p_x += odm_width;
						}
					}else{
						odf_p_x = odf_panel_width;
						if(StringUtils.isNotBlank(lplfs) && lplfs.equals("AD005")){
							odf_p_y -= (odm_height+DEFAULT_ODM_PADDING_TOPBOTTOM);
						}else{
							odf_p_y += (odm_height+DEFAULT_ODM_PADDING_TOPBOTTOM);
						}
					}
				}
				if(p == 0){
					gjjx.setTwwidth(String.valueOf(odf_width));
					gjjx.setTwheight(String.valueOf(odf_height));
					gjjx.setTwx("0");
					gjjx.setTwy("0");
					gjjxService.saveOrUpdate(gjjx);
				}
			}
		}
		//光分纤箱
		else if(zylx.equals("AA004")){
			GfxxEntity gfxx = gfxxService.view(xtbh);
			int ls = 0; //列数
			int hs = 0; //行数
			int kls = 0; //块端子列数
			int khs = 0; //块端子行数
			try{
				ls = gfxx.getLs();
				hs = Integer.parseInt(gfxx.getLmks());
				kls = gfxx.getKls();
				khs = gfxx.getKhs();
			}
			catch(Exception ex){}
			String lplfs = gfxx.getLplfs();//列排列方式
			String hplfs = gfxx.getKplfs();//行排列方式
			String dzlplfs = gfxx.getDzlplfs();//端子列排列方式
			String dzhplfs = gfxx.getDzhplfs();//端子行排列方式
			String dzgz = gfxx.getDzbhgz(); //端子排列规则
			int dev_width=((kls*18)+DEFAULT_AB_PADDING_TOPBOTTOM)*ls+DEFAULT_AB_PADDING_TOPBOTTOM*2+10;
			int dev_height=((khs*18)+DEFAULT_AB_PADDING_TOPBOTTOM)*hs+30;
			int loc_x=0;
			int loc_y=30;
			int sub_dev_width = kls*18;
			int sub_dev_height = khs*18;
			int kh= 1;
			//按列优排列
			for(int c =0 ;c<ls;c++){
				if(StringUtils.isNotBlank(lplfs) && lplfs.equals("AD005")){
					if(c ==0 ){
						loc_x -= DEFAULT_AB_PADDING_TOPBOTTOM;
					}else{
						loc_x -= sub_dev_width+DEFAULT_AB_PADDING_TOPBOTTOM;
					}
					loc_y = DEFAULT_AB_PADDING_TOPBOTTOM;
				}else{
					if(c ==0 ){
						loc_x += DEFAULT_AB_PADDING_TOPBOTTOM;
					}else{
						loc_x += sub_dev_width+DEFAULT_AB_PADDING_TOPBOTTOM;
					}
					loc_y = DEFAULT_AB_PADDING_TOPBOTTOM;
				}
				for(int r =0;r<hs;r++){
					if(StringUtils.isNotBlank(hplfs) && hplfs.equals("AD001")){
						if(r == 0){
							loc_y -= DEFAULT_AB_PADDING_TOPBOTTOM;
						}else{
							loc_y -= sub_dev_height + DEFAULT_AB_PADDING_TOPBOTTOM;
						}
					}else{
						if(r == 0){
							loc_y += DEFAULT_AB_PADDING_TOPBOTTOM;
						}else{
							loc_y += sub_dev_height + DEFAULT_AB_PADDING_TOPBOTTOM;
						}
					}
					
					if("AE602".equals(dzgz)){
						//端子列优
						int port_x = loc_x;
						int port_y = loc_y;
						int pid = 1;
						for(int dc =0 ; dc< kls ; dc++){
								if(StringUtils.isNotBlank(dzhplfs) && dzhplfs.equals("AD005")){
									port_x -= DEFAULT_PORT_PADDING+10;
									port_y = loc_y;
								}else{
									port_x += DEFAULT_PORT_PADDING+10;
									port_y = loc_y;
								}		
							for(int dr=0; dr<khs; dr++){
								if(StringUtils.isNotBlank(dzlplfs) && dzlplfs.equals("AD001")){
									port_y -= DEFAULT_PORT_PADDING+10;
								}else{
									port_y += DEFAULT_PORT_PADDING+10;
								}	
								PortEntity pentity = new PortEntity();
								pentity.setXtbh(mapper.getXTBH());
								pentity.setTwx(String.valueOf(port_x));
								pentity.setTwy(String.valueOf(port_y));
								pentity.setSssb(gfxx.getXtbh());
								pentity.setDzbh(String.valueOf(pid));
								pentity.setPortname(String.valueOf(kh+"-"+pid));
								savePort(pentity,zylx);
								pid++;
							}
						}
					}else{
						//端子列优
						int port_x = loc_x;
						int port_y = loc_y;
						int pid = 1;
						for(int dr=0; dr<khs; dr++){
								if(StringUtils.isNotBlank(dzlplfs) && dzlplfs.equals("AD001")){
									port_y -= DEFAULT_PORT_PADDING+10;
									port_x = loc_x;
								}else{
									port_y += DEFAULT_PORT_PADDING+10;
									port_x = loc_x;
								}		
							for(int dc =0 ; dc< kls ; dc++){
								if(StringUtils.isNotBlank(dzhplfs) && dzhplfs.equals("AD005")){
									port_x -= DEFAULT_PORT_PADDING+10;
								}else{
									port_x += DEFAULT_PORT_PADDING+10;
								}	
								PortEntity pentity = new PortEntity();
								pentity.setXtbh(mapper.getXTBH());
								pentity.setTwx(String.valueOf(port_x));
								pentity.setTwy(String.valueOf(port_y));
								pentity.setSssb(gfxx.getXtbh());
								pentity.setDzbh(String.valueOf(pid));
								pentity.setPortname(String.valueOf(kh+"-"+pid));
								savePort(pentity,zylx);
								pid++;
							}
						}
					}
					kh++;
				}
			}
			gfxx.setTwwidth(String.valueOf(dev_width));
			gfxx.setTwheight(String.valueOf(dev_height));
			gfxx.setTwx("0");
			gfxx.setTwy("0");
			gfxxService.saveOrUpdate(gfxx);
		}
		//光终端盒
		else if(zylx.equals("AA006")){
			GzdhEntity gzdh = gzdhservice.getbyid(xtbh);
			int ls = 0; //列数
			int hs = 0; //行数
			int kls = 0; //块端子列数
			int khs = 0; //块端子行数
			try{
				ls = gzdh.getLs();
				hs = Integer.parseInt(gzdh.getLmks());
				kls = gzdh.getKls();
				khs = gzdh.getKhs();
			}
			catch(Exception ex){}
			String lplfs = gzdh.getLplfs();//列排列方式
			String hplfs = gzdh.getKplfs();//行排列方式
			String dzlplfs = gzdh.getDzlplfs();//端子列排列方式
			String dzhplfs = gzdh.getDzhplfs();//端子行排列方式
			String dzgz = gzdh.getDzbhgz(); //端子排列规则
			int dev_width=((kls*18)+DEFAULT_AB_PADDING_TOPBOTTOM)*ls+DEFAULT_AB_PADDING_TOPBOTTOM*2+10;
			int dev_height=((khs*18)+DEFAULT_AB_PADDING_TOPBOTTOM)*hs+30;
			int loc_x=0;
			int loc_y=30;
			int sub_dev_width = kls*18;
			int sub_dev_height = khs*18;
			int kh= 1;
			//按列优排列
			for(int c =0 ;c<ls;c++){
				if(StringUtils.isNotBlank(lplfs) && lplfs.equals("AD005")){
					if(c ==0 ){
						loc_x -= DEFAULT_AB_PADDING_TOPBOTTOM;
					}else{
						loc_x -= sub_dev_width+DEFAULT_AB_PADDING_TOPBOTTOM;
					}
					loc_y = DEFAULT_AB_PADDING_TOPBOTTOM;
				}else{
					if(c ==0 ){
						loc_x += DEFAULT_AB_PADDING_TOPBOTTOM;
					}else{
						loc_x += sub_dev_width+DEFAULT_AB_PADDING_TOPBOTTOM;
					}
					loc_y = DEFAULT_AB_PADDING_TOPBOTTOM;
				}
				for(int r =0;r<hs;r++){
					if(StringUtils.isNotBlank(hplfs) && hplfs.equals("AD001")){
						if(r == 0){
							loc_y -= DEFAULT_AB_PADDING_TOPBOTTOM;
						}else{
							loc_y -= sub_dev_height + DEFAULT_AB_PADDING_TOPBOTTOM;
						}
					}else{
						if(r == 0){
							loc_y += DEFAULT_AB_PADDING_TOPBOTTOM;
						}else{
							loc_y += sub_dev_height + DEFAULT_AB_PADDING_TOPBOTTOM;
						}
					}
					
					if("AE602".equals(dzgz)){
						//端子列优
						int port_x = loc_x;
						int port_y = loc_y;
						int pid = 1;
						for(int dc =0 ; dc< kls ; dc++){
								if(StringUtils.isNotBlank(dzhplfs) && dzhplfs.equals("AD005")){
									port_x -= DEFAULT_PORT_PADDING+10;
									port_y = loc_y;
								}else{
									port_x += DEFAULT_PORT_PADDING+10;
									port_y = loc_y;
								}		
							for(int dr=0; dr<khs; dr++){
								if(StringUtils.isNotBlank(dzlplfs) && dzlplfs.equals("AD001")){
									port_y -= DEFAULT_PORT_PADDING+10;
								}else{
									port_y += DEFAULT_PORT_PADDING+10;
								}	
								PortEntity pentity = new PortEntity();
								pentity.setXtbh(mapper.getXTBH());
								pentity.setTwx(String.valueOf(port_x));
								pentity.setTwy(String.valueOf(port_y));
								pentity.setSssb(gzdh.getXtbh());
								pentity.setDzbh(String.valueOf(pid));
								pentity.setPortname(String.valueOf(kh+"-"+pid));
								savePort(pentity,zylx);
								pid++;
							}
						}
					}else{
						//端子列优
						int port_x = loc_x;
						int port_y = loc_y;
						int pid = 1;
						for(int dr=0; dr<khs; dr++){
								if(StringUtils.isNotBlank(dzlplfs) && dzlplfs.equals("AD001")){
									port_y -= DEFAULT_PORT_PADDING+10;
									port_x = loc_x;
								}else{
									port_y += DEFAULT_PORT_PADDING+10;
									port_x = loc_x;
								}		
							for(int dc =0 ; dc< kls ; dc++){
								if(StringUtils.isNotBlank(dzhplfs) && dzhplfs.equals("AD005")){
									port_x -= DEFAULT_PORT_PADDING+10;
								}else{
									port_x += DEFAULT_PORT_PADDING+10;
								}	
								PortEntity pentity = new PortEntity();
								pentity.setXtbh(mapper.getXTBH());
								pentity.setTwx(String.valueOf(port_x));
								pentity.setTwy(String.valueOf(port_y));
								pentity.setSssb(gzdh.getXtbh());
								pentity.setDzbh(String.valueOf(pid));
								pentity.setPortname(String.valueOf(kh+"-"+pid));
								savePort(pentity,zylx);
								pid++;
							}
						}
					}
					kh++;
				}
			}
			gzdh.setTwwidth(String.valueOf(dev_width));
			gzdh.setTwheight(String.valueOf(dev_height));
			gzdh.setTwx("0");
			gzdh.setTwy("0");
			gzdhservice.saveorupdate(gzdh);
		}
	}
	
	private OdmEntity getODM(List<OdmEntity> odms , int panel,int kh){
		String panelName = "";
		if(panel == 0){
			panelName = "AE301";
		}else{
			panelName = "AE302";
		}
		for(int i = 0; odms != null && i < odms.size() ; i++){
			OdmEntity odm = odms.get(i);
			if(panelName.equals(odm.getSssbm()) && String.valueOf(kh).equals(odm.getGh())){
				return odm;
			}
		}
		return null;
	}
	
	private int getMaxRowHeight(int rows,int columns,int panel,String rule,String sssb,int row){
		List<String> khs = new ArrayList<String>();
		int kh = 1;
		if("AE602".equals(rule)){
			for(int c = 0;c<columns;c++){
				for(int r = 0;r<rows;r++){
					if(r == row){
						khs.add(String.valueOf(kh));
					}
					kh++;
				}
			}
		}else{
			for(int r = 0;r<rows;r++){
				for(int c = 0;c<columns;c++){
					if(r == row){
						khs.add(String.valueOf(kh));
					}
					kh++;
				}
			}
		}
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("sssb", sssb);
		params.put("sssbm", panel == 0? "AE301" : "AE302");
		params.put("khs", khs);
		String width = connectMapper.getMaxHeight(params);
		return StringUtils.isNotBlank(width)?Integer.parseInt(width):100;
	}
	
	private int getMaxColumnWidth(int rows,int columns,int panel,String rule,String sssb,int col){
		List<String> khs = new ArrayList<String>();
		int kh = 1;
		if("AE602".equals(rule)){
			for(int c = 0;c<columns;c++){
				for(int r = 0;r<rows;r++){
					if(c == col){
						khs.add(String.valueOf(kh));
					}
					kh++;
				}
			}
		}else{
			for(int r = 0;r<rows;r++){
				for(int c = 0;c<columns;c++){
					if(c == col){
						khs.add(String.valueOf(kh));
					}
					kh++;
				}
			}
		}
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("sssb", sssb);
		params.put("sssbm", panel == 0? "AE301" : "AE302");
		params.put("khs", khs);
		String width = connectMapper.getMaxWidth(params);
		return StringUtils.isNotBlank(width)?Integer.parseInt(width):100;
	}
	
	/**
	 * 根据光缆段id计算面板展示所需宽度
	 * @param xtbh
	 * @return
	 */
	private String getWidthByLineId(String xtbh){
		GldlyEntity gldly = gldlyservice.getbyid(xtbh);
		int xxs = 0;
		try{xxs = Integer.parseInt(gldly.getXxs());}catch(Exception ex){}
		//光缆段固定排列方式为每行最大12跟线芯，超过换行。
		return String.valueOf(xxs < 12 ? xxs * 18 : 12*18); 
	}
	
	/**
	 * 
	 * @param xtbh
	 * @return
	 */
	private List<Node> getNodesLINE(String xtbh,String topid,String toptype){
		List<Node> nodes = new ArrayList<Node>();
		GldlyEntity gldly = gldlyservice.getbyid(xtbh);
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("topid", topid);
		params.put("toptype", toptype);
		List<String> lineNos = connectMapper.getUsedLines(params);
		int xxs = 0;
		try{xxs = Integer.parseInt(gldly.getXxs());}catch(Exception ex){}
		Node nodeframe = new Node();
		nodeframe.setImage(GLDLY_BACKGROUND);
		nodeframe.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
		nodeframe.setName(gldly.getZymc());
		nodeframe.setLocation(0,0);
		nodeframe.setSize((xxs < 12 ? xxs * 18 : 12*18),(xxs%12==0?xxs/12 : xxs/12+1)*18+30);
		nodeframe.setStyle(Styles.IMAGE_OUTLINE_WIDTH, 2);
		nodeframe.setStyle(Styles.IMAGE_OUTLINE_COLOR, 0xFE0707);
		int loc_x = 0;
		int loc_y = 0;
		int xno = 1;
		for(int x =0;x<xxs;x++){
			if(x%12 == 0){
				loc_y += 10+DEFAULT_PORT_PADDING;
				loc_x = 0;
			}
			loc_x += 10+DEFAULT_PORT_PADDING;
			Node nodePort = new Node();
			nodePort.setToolTip(String.valueOf(xno));
			if(lineNos.contains(String.valueOf(xno))){
				nodePort.setImage(PORT_USED_IMAGE);
				nodePort.setClient("status", "1");
			}else{
				nodePort.setImage(PORT_FREE_IMAGE);
				nodePort.setClient("status", "0");
			}
			nodePort.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
			nodePort.setSize(12,12);
			nodePort.setLocation(loc_x,loc_y);
			nodePort.setParent(nodeframe);
			nodePort.setClient("xtbh", xtbh);
			nodePort.setClient("zylx", "A33");
			nodes.add(nodePort);
			xno++;
		}
		nodes.add(nodeframe);
		return nodes;
	}
	
	private List<Node> getNodesODFGJXX(String xtbh,String zylx){
		List<Node> nodes = new ArrayList<Node>();
		
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		List<Map<String,Object>> odf = connectMapper.getNodes(params);
		if(odf != null && odf.size() > 0 ){
			Node nodeA = new Node();
			nodeA.setName(String.valueOf(odf.get(0).get("NODENAME"))+"[A面]");
			nodeA.setImage(FRAME_BACKGROUND);
			nodeA.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
			nodeA.setSize(Integer.parseInt(String.valueOf(odf.get(0).get("NODEWIDTH") == null ? "0":odf.get(0).get("NODEWIDTH"))),Integer.parseInt(String.valueOf(odf.get(0).get("NODEHEIGHT") ==null ? "0":odf.get(0).get("NODEHEIGHT"))));
			nodeA.setLocation(0,0);
			nodeA.setStyle(Styles.LABEL_POSITION,Consts.POSITION_TOPLEFT);
			nodeA.setStyle(Styles.LABEL_XOFFSET,75);
			nodeA.setStyle(Styles.LABEL_YOFFSET,12);
			nodeA.setStyle(Styles.IMAGE_OUTLINE_WIDTH, 2);
			nodeA.setStyle(Styles.IMAGE_OUTLINE_COLOR, 0x022D59);
			params = new HashMap<String, Object>();
			params.put("xtbh", xtbh);
			params.put("zylx", "AD703");
			params.put("sssbm", "AE301");
			List<Map<String,Object>> odms_a = connectMapper.getNodes(params);
			for(int i =0;odms_a != null && i<odms_a.size(); i++){
				Node nodeODM = new Node();
				nodeODM.setName(String.valueOf(odms_a.get(i).get("NODENAME")));
				if("0".equals(String.valueOf(odms_a.get(i).get("NODEPLFS")))){
					nodeODM.setImage(V_MODULE_BACKGROUND);
				}else{
					nodeODM.setImage(H_MODULE_BACKGROUND);
				}
				nodeODM.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
				nodeODM.setSize(Integer.parseInt(String.valueOf(odms_a.get(i).get("NODEWIDTH")==null?"0":odms_a.get(i).get("NODEWIDTH"))),Integer.parseInt(String.valueOf(odms_a.get(i).get("NODEHEIGHT")==null?"0":odms_a.get(i).get("NODEHEIGHT"))));
				nodeODM.setLocation(Integer.parseInt(String.valueOf(odms_a.get(i).get("NODEX")==null?"0":odms_a.get(i).get("NODEX"))),Integer.parseInt(String.valueOf(odms_a.get(i).get("NODEY")==null?"0":odms_a.get(i).get("NODEY"))));
				nodeODM.setStyle(Styles.IMAGE_OUTLINE_WIDTH, 1);
				nodeODM.setStyle(Styles.IMAGE_OUTLINE_COLOR, 0x336699);
				params = new HashMap<String, Object>();
				params.put("xtbh", xtbh);
				if(zylx.equals("AA001")){
				params.put("zylx", "ODFPORT");
				}else{
					params.put("zylx", "GJJXPORT");
				}
				params.put("ssodm", String.valueOf(odms_a.get(i).get("NODEID")));
				List<Map<String,Object>> ports = connectMapper.getNodes(params);
				for(int p = 0 ; ports!=null&& p<ports.size(); p++){
					Node nodePort = new Node();
					nodePort.setToolTip(String.valueOf(ports.get(p).get("NODENAME")));
					if("AD203".equals(String.valueOf(ports.get(p).get("NODESTATE")))){
						nodePort.setImage(PORT_USED_IMAGE);
						nodePort.setClient("status", "1");
					}else{
						nodePort.setImage(PORT_FREE_IMAGE);
						nodePort.setClient("status", "0");
					}
					nodePort.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
					nodePort.setSize(12,12);
					nodePort.setLocation(Integer.parseInt(String.valueOf(ports.get(p).get("NODEX")==null?"0":ports.get(p).get("NODEX"))),Integer.parseInt(String.valueOf(ports.get(p).get("NODEY")==null?"0":ports.get(p).get("NODEY"))));
					nodePort.setParent(nodeODM);
					nodePort.setClient("xtbh", xtbh);
					nodePort.setClient("zylx", zylx);
					nodes.add(nodePort);
				}
				nodeODM.setParent(nodeA);
				nodes.add(nodeODM);
			}
			
			Node nodeB = new Node();
			nodeB.setName(String.valueOf(odf.get(0).get("NODENAME"))+"[B面]");
			nodeB.setImage(FRAME_BACKGROUND);
			nodeB.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
			nodeB.setSize(Integer.parseInt(String.valueOf(odf.get(0).get("NODEWIDTH") == null ? "0":odf.get(0).get("NODEWIDTH"))),Integer.parseInt(String.valueOf(odf.get(0).get("NODEHEIGHT") ==null ? "0":odf.get(0).get("NODEHEIGHT"))));
			nodeB.setLocation(Integer.parseInt(String.valueOf(odf.get(0).get("NODEWIDTH") == null ? "0":odf.get(0).get("NODEWIDTH"))),0);
			nodeB.setStyle(Styles.LABEL_POSITION,Consts.POSITION_TOPLEFT);
			nodeB.setStyle(Styles.LABEL_XOFFSET,75);
			nodeB.setStyle(Styles.LABEL_YOFFSET,12);
			nodeB.setStyle(Styles.IMAGE_OUTLINE_WIDTH, 2);
			nodeB.setStyle(Styles.IMAGE_OUTLINE_COLOR, 0x022D59);
			params = new HashMap<String, Object>();
			params.put("xtbh", xtbh);
			params.put("zylx", "AD703");
			params.put("sssbm", "AE302");
			List<Map<String,Object>> odms_b = connectMapper.getNodes(params);
			for(int i =0;odms_b != null && i<odms_b.size(); i++){
				Node nodeODM = new Node();
				nodeODM.setName(String.valueOf(odms_b.get(i).get("NODENAME")));
				if("0".equals(String.valueOf(odms_a.get(i).get("NODEPLFS")))){
					nodeODM.setImage(V_MODULE_BACKGROUND);
				}else{
					nodeODM.setImage(H_MODULE_BACKGROUND);
				}
				nodeODM.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
				nodeODM.setSize(Integer.parseInt(String.valueOf(odms_b.get(i).get("NODEWIDTH")==null?"0":odms_b.get(i).get("NODEWIDTH"))),Integer.parseInt(String.valueOf(odms_b.get(i).get("NODEHEIGHT")==null?"0":odms_b.get(i).get("NODEHEIGHT"))));
				nodeODM.setLocation(Integer.parseInt(String.valueOf(odms_b.get(i).get("NODEX")==null?"0":odms_b.get(i).get("NODEX"))),Integer.parseInt(String.valueOf(odms_b.get(i).get("NODEY")==null?"0":odms_b.get(i).get("NODEY"))));
				nodeODM.setStyle(Styles.IMAGE_OUTLINE_WIDTH, 1);
				nodeODM.setStyle(Styles.IMAGE_OUTLINE_COLOR, 0x336699);
				
				params = new HashMap<String, Object>();
				params.put("xtbh", xtbh);
				if(zylx.equals("AA001")){
				params.put("zylx", "ODFPORT");
				}else{
					params.put("zylx", "GJJXPORT");
				}
				params.put("sssb", xtbh);
				params.put("ssodm", String.valueOf(odms_b.get(i).get("NODEID")));
				List<Map<String,Object>> ports = connectMapper.getNodes(params);
				for(int p = 0 ; ports!=null&& p<ports.size(); p++){
					Node nodePort = new Node();
					nodePort.setToolTip(String.valueOf(ports.get(p).get("NODENAME")));
					if("AD203".equals(String.valueOf(ports.get(p).get("NODESTATE")))){
						nodePort.setImage(PORT_USED_IMAGE);
						nodePort.setClient("status", "1");
					}else{
						nodePort.setImage(PORT_FREE_IMAGE);
						nodePort.setClient("status", "0");
					}
					nodePort.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
					nodePort.setSize(12,12);
					nodePort.setLocation(Integer.parseInt(String.valueOf(ports.get(p).get("NODEX")==null?"0":ports.get(p).get("NODEX"))),Integer.parseInt(String.valueOf(ports.get(p).get("NODEY")==null?"0":ports.get(p).get("NODEY"))));
					nodePort.setParent(nodeODM);
					nodePort.setClient("xtbh", xtbh);
					nodePort.setClient("zylx", zylx);
					nodes.add(nodePort);
				}
				nodeODM.setParent(nodeB);
				nodes.add(nodeODM);
			}
			nodes.add(nodeA);
			nodes.add(nodeB);
		}
		return nodes;
	}
	
	private List<Node> getNodesGFXXGZDH(String xtbh,String zylx){
		List<Node> nodes = new ArrayList<Node>();
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		List<Map<String,Object>> gfxx = connectMapper.getNodes(params);
		if(gfxx != null && gfxx.size() > 0 ){
			Node nodeFrame = new Node();
			nodeFrame.setName(String.valueOf(gfxx.get(0).get("NODENAME")));
			nodeFrame.setImage(FRAME_BACKGROUND);
			nodeFrame.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
			nodeFrame.setSize(Integer.parseInt(String.valueOf(gfxx.get(0).get("NODEWIDTH") == null ? "0":gfxx.get(0).get("NODEWIDTH"))),Integer.parseInt(String.valueOf(gfxx.get(0).get("NODEHEIGHT") ==null ? "0":gfxx.get(0).get("NODEHEIGHT"))));
			nodeFrame.setLocation(0,0);
			nodeFrame.setStyle(Styles.LABEL_POSITION,Consts.POSITION_TOPLEFT);
			nodeFrame.setStyle(Styles.LABEL_XOFFSET,75);
			nodeFrame.setStyle(Styles.LABEL_YOFFSET,12);
			nodeFrame.setStyle(Styles.IMAGE_OUTLINE_WIDTH, 2);
			nodeFrame.setStyle(Styles.IMAGE_OUTLINE_COLOR, 0x022D59);
			//获取端子
			params = new HashMap<String, Object>();
			params.put("xtbh", xtbh);
			if("AA004".equals(zylx)){
				params.put("zylx", "GFXXPORT");
			}else{
				params.put("zylx", "GZDHPORT");
			}
			List<Map<String,Object>> ports = connectMapper.getNodes(params);
			for(int p =0 ; ports!=null && p<ports.size(); p++){
				Node nodePort = new Node();
				nodePort.setToolTip(String.valueOf(ports.get(p).get("NODENAME")));
				if("AD203".equals(String.valueOf(ports.get(p).get("NODESTATE")))){
					nodePort.setImage(PORT_USED_IMAGE);
					nodePort.setClient("status", "1");
				}else{
					nodePort.setImage(PORT_FREE_IMAGE);
					nodePort.setClient("status", "0");
				}
				nodePort.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
				nodePort.setSize(12,12);
				nodePort.setLocation(Integer.parseInt(String.valueOf(ports.get(p).get("NODEX")==null?"0":ports.get(p).get("NODEX"))),Integer.parseInt(String.valueOf(ports.get(p).get("NODEY")==null?"0":ports.get(p).get("NODEY"))));
				nodePort.setParent(nodeFrame);
				nodePort.setClient("xtbh", xtbh);
				nodePort.setClient("zylx", zylx);
				nodes.add(nodePort);
			}
			nodes.add(nodeFrame);
		}
		return nodes;
	}
	
	/**
	 * 获取ODM面板节点
	 * @param xtbh
	 * @param zylx
	 * @return
	 */
	private List<Node> getNodesODM(String xtbh , String zylx){
		List<Node> nodes = new ArrayList<Node>();
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", "ODM");
		List<Map<String,Object>> odm = connectMapper.getNodes(params);
		if(odm != null && odm.size() > 0 ){
			int offsetX = 0;
			int offsetY = 0;
			try{
				offsetX = Integer.parseInt(String.valueOf(odm.get(0).get("NODEX")));
				offsetY = Integer.parseInt(String.valueOf(odm.get(0).get("NODEY")));
			}catch(Exception ex){}
			
			Node nodeODM = new Node();
			nodeODM.setName(String.valueOf(odm.get(0).get("NODENAME")));
			if("0".equals(String.valueOf(odm.get(0).get("NODEPLFS")))){
				nodeODM.setImage(V_MODULE_BACKGROUND);
			}else{
				nodeODM.setImage(H_MODULE_BACKGROUND);
			}
			nodeODM.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
			nodeODM.setSize(Integer.parseInt(String.valueOf(odm.get(0).get("NODEWIDTH")==null?"0":odm.get(0).get("NODEWIDTH"))),Integer.parseInt(String.valueOf(odm.get(0).get("NODEHEIGHT")==null?"0":odm.get(0).get("NODEHEIGHT"))));
			nodeODM.setLocation(0,0);
			nodeODM.setStyle(Styles.IMAGE_OUTLINE_WIDTH, 1);
			nodeODM.setStyle(Styles.IMAGE_OUTLINE_COLOR, 0x336699);
			
			params = new HashMap<String, Object>();
			params.put("xtbh", xtbh);
			params.put("zylx", "ODMPORT");
			params.put("pzylx", String.valueOf(odm.get(0).get("SSSBLX")));
			List<Map<String,Object>> ports = connectMapper.getNodes(params);
			for(int p =0;ports!= null&&p<ports.size();p++){
				Node nodePort = new Node();
				nodePort.setToolTip(String.valueOf(ports.get(p).get("NODENAME")));
				if("AD203".equals(String.valueOf(ports.get(p).get("NODESTATE")))){
					nodePort.setImage(PORT_USED_IMAGE);
					nodePort.setClient("status", "1");
				}else{
					nodePort.setImage(PORT_FREE_IMAGE);
					nodePort.setClient("status", "0");
				}
				nodePort.setStyle(Styles.IMAGE_STRETCH,Consts.STRETCH_FILL);
				nodePort.setSize(12,12);
				nodePort.setLocation(Integer.parseInt(String.valueOf(ports.get(p).get("NODEX")==null?"0":ports.get(p).get("NODEX")))-offsetX,Integer.parseInt(String.valueOf(ports.get(p).get("NODEY")==null?"0":ports.get(p).get("NODEY")))-offsetY);
				nodePort.setParent(nodeODM);
				nodePort.setClient("xtbh", String.valueOf(odm.get(0).get("SSSB")));
				nodePort.setClient("zylx", String.valueOf(odm.get(0).get("SSSBLX")));
				nodes.add(nodePort);
			}
			nodes.add(nodeODM);
		}
		return nodes;
	}
	
	/**
	 * 根据设备编号和资源类型获取设备在Twaver中的节点信息
	 * @param xtbh
	 * @param zylx
	 * @return
	 */
	private List<Node> getNodes(String xtbh,String zylx,String topid,String toptype){
		if(StringUtils.isBlank(xtbh) || StringUtils.isBlank(zylx)){
			return null;
		}
		else if(zylx.equals("AA001") || zylx.equals("AA003")){
			return getNodesODFGJXX(xtbh,zylx);
		}
		else if(zylx.equals("AA004") || zylx.equals("AA006")){
			return getNodesGFXXGZDH(xtbh,zylx);
		}
		else if(zylx.equals("AD703")){
			return getNodesODM(xtbh,zylx);
		}
		else{
			return getNodesLINE(xtbh,topid,toptype);
		}
	}
	
	private void savePort(PortEntity entity,String zylx){
		//ODF
		if(zylx.equals("AA001")){connectMapper.saveODFConn(entity);}
		//光交
		else if(zylx.equals("AA003")){connectMapper.saveGJJXConn(entity);}
		//光分
		else if(zylx.equals("AA004")){connectMapper.saveGFXXConn(entity);}
		//终端盒
		else if(zylx.equals("AA006")){connectMapper.saveGZDHConn(entity);}
	}

	/**
	 * 将XML反序列化为ElementBox后，遍历所有的Links后， 再将标记为要新增的连接关系插入到对应的连接表。
	 * 
	 * @param xml
	 *            客户端(flex-Twaver)操作后并且序列化后的XML
	 */
	public void saveConnects(String xml,String lid,String ltype,String rid,String rtype,String tid,String ttype) {
		ElementBox box = deSerialize(xml);
		for(int i = 0;box.getDatas()!= null && i<box.getDatas().size();i++){
			System.out.println(box.getDatas().get(i).getClass().getName());
			if(box.getDatas().get(i).getClass().getName().equals("twaver.Link")){
				Link link = (Link)box.getDatas().get(i);
				String status = String.valueOf(link.getClient("status"));
				if(StringUtils.isNotBlank(status) && status.equals("1")){
					Node from = link.getFromNode();
					Node to = link.getToNode();
					String a_xtbh = String.valueOf(from.getClient("xtbh"));
					String a_zylx = String.valueOf(from.getClient("zylx"));
					String a_mc = from.getToolTip();
					String z_xtbh = String.valueOf(to.getClient("xtbh"));
					String z_zylx = String.valueOf(to.getClient("zylx"));
					String z_mc = to.getToolTip();
					if(ltype.equals("A33") && rtype.equals("A33")){
						//熔纤
						this.insertLineConnect(tid, ttype, a_xtbh, a_mc, z_xtbh, z_mc);
					}
					else if (ltype.equals("A33") || rtype.equals("A33")){
						//成端
						this.insertPortConnect(a_xtbh, a_zylx, a_mc, z_xtbh, z_zylx, z_mc, "AA203");
					}
					else{
						//跳纤
						this.insertPortConnect(a_xtbh, a_zylx, a_mc, z_xtbh, z_zylx, z_mc, "AA201");
					}
				}
			}
		}
	}

	/**
	 * 将左右两个设备的跳纤或成端连接信息组合成一个列表输出
	 * 
	 * @param _leftId
	 *            左边的设备ID
	 * @param _leftType
	 *            左边的设备类型
	 * @param ctype
	 *            连接类型         
	 * @return 返回组合后的列表
	 */
	public List<Map<String, Object>> getPortConnects(String _leftId,
			String _leftType,String ctype) {
		//光接头和机房没有成端和跳纤信息
		if(StringUtils.isNotBlank(_leftType) && !_leftType.equals("AA005") && !_leftType.equals("AD701")){
			Map<String,Object> params = new HashMap<String, Object>();
			params.put("xtbh", _leftId);
			params.put("zylx", _leftType);
			params.put("ctype", ctype);
			if(_leftType.equals("AD703")){
				OdmEntity odm = odmservice.getbyid(_leftId);
				params.put("parenttype", odm.getSssblx());
			}
			return connectMapper.getPortConnects(params);
		}
		return null;
	}

	/**
	 * 将左右两个设备的熔纤信息组合成一个列表输出
	 * 
	 * @param _leftId
	 *            左边的设备ID
	 * @param _leftType
	 *            左边的设备类型
	 * @return 返回组合后的列表
	 */
	public List<Map<String, Object>> getLineConnects(String _leftId,String _leftType) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", _leftId);
		params.put("zylx", _leftType);
		return connectMapper.getLineConnects(params);
	}

	/**
	 * 获取资源树（呈现在界面左上角区域）
	 * 
	 * @param xtbh
	 *            系统编号
	 * @param zylx
	 *            资源类型
	 * @return
	 */
	public List<Map<String, Object>> getResTree(String xtbh, String zylx) {
		if(StringUtils.isBlank(zylx)){return null;}
		//机房
		else if(zylx.equals("AD701")){return jfxxservice.getResTree(xtbh);}
		//ODF
		else if(zylx.equals("AA001")){return odfservice.getResTree(xtbh);}
		//光交
		else if(zylx.equals("AA003")){return gjjxService.getResTree(xtbh);}
		//光分
		else if(zylx.equals("AA004")){return gfxxService.getResTree(xtbh);}
		//终端盒
		else if(zylx.equals("AA006")){return gzdhservice.getResTree(xtbh);}
		//光接头
		else if(zylx.equals("AA005")){return gjtservice.getResTree(xtbh);}
		return null;
	}

	/**
	 * 获取光缆列表（呈现在界面左下角区域）
	 * 
	 * @param xtbh
	 *            系统编号
	 * @param zylx
	 *            资源类型
	 * @return
	 */
	public List<Map<String, Object>> getSublines(String xtbh, String zylx) {
		return gldlyservice.getByIdByType(xtbh, zylx);
	}

	/**
	 * 删除跳纤、成端关系
	 * @param xtbh 系统编号
	 * @param zylx 资源类型
	 * @param ctype 连接类型
	 */
	public void deletePortConnect(String xtbh, String zylx, String ctype) {
		Map<String,Object> params_1 = new HashMap<String, Object>();
		params_1.put("xtbh", xtbh);
		params_1.put("zylx", zylx);
		if("AA201".equals(ctype)){
			Map<String,Object> params_2 = new HashMap<String, Object>();
			Map<String, Object> portinfo = getConnectZD(xtbh,zylx);
			String zdxtbh = "";
			String zdzylx = "";
			String zdmc = "";
			if(portinfo != null){
				zdxtbh = portinfo.get("TO_ID") == null ? "":String.valueOf(portinfo.get("TO_ID"));
				zdzylx = portinfo.get("TO_CLASSID") == null ? "":String.valueOf(portinfo.get("TO_CLASSID"));
				zdmc = portinfo.get("TO_FIRSTUNIT") == null ? "":String.valueOf(portinfo.get("TO_FIRSTUNIT"));
			}
			if(StringUtils.isNotBlank(zdxtbh)){
				Map<String, Object> zdport = getConnect(zdxtbh,zdzylx,zdmc);
				String zdport_xtbh = zdport == null ? "" : String.valueOf(zdport.get("XTBH"));
				params_2.put("xtbh", zdport_xtbh);
				params_2.put("zylx", zdzylx);
				connectMapper.deletePortConnect(params_2);
				connectMapper.deletePortConnect(params_1);
			}
		}else{
			connectMapper.deletePortConnect(params_1);
		}
	}

	/**
	 * 删除熔纤关系
	 * @param xtbh 系统编号
	 */
	public void deleteLineConnect(String xtbh) {
		connectMapper.deleteLineConnect(xtbh);
	}

	/**
	 * 根据资源ID,类型,端子名称获取端子属性
	 * @param xtbh 系统编号
	 * @param zylx 资源类型
	 * @param mc 名称
	 * @return 结果集
	 */
	public Map<String, Object> getConnect(String xtbh, String zylx, String mc) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		params.put("mc", mc);
		return connectMapper.getConnect(params);
	}
	
	/**
	 * 根据资源类型和端子xtbh获取z端xtbh
	 * @param xtbh 系统编号
	 * @param zylx 资源类型
	 * @param mc 名称
	 * @return 结果集
	 */
	public Map<String,Object> getConnectZD(String xtbh, String zylx) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		return connectMapper.getConnectZD(params);
	}

	/**
	 * 编辑端子信息
	 * @param xtbh 系统编号
	 * @param zylx 资源类型
	 * @param zxtbh z端系统编号
	 * @param zzylx z端资源类型
	 * @param zmc z端名称
	 * @param ctype 连接类型
	 */
	public void updateConnect(String xtbh, String zylx,String zxtbh, String zzylx, String zmc, String ctype) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", xtbh);
		params.put("zylx", zylx);
		params.put("zxtbh", zxtbh);
		params.put("zzylx", zzylx);
		params.put("zmc", zmc);
		params.put("ctype", ctype);
		connectMapper.updateConnect(params);
	}
	

	/**
	 * 插入跳纤、成端关系
	 * @param axtbh A端系统编号
	 * @param azylx A端资源类型
	 * @param amc A端名称
	 * @param zxtbh Z端系统编号
	 * @param zzylx Z端资源类型
	 * @param zmc Z端名称
	 * @param ctype 连接类型
	 */
	public void insertPortConnect(String axtbh, String azylx, String amc,
			String zxtbh, String zzylx, String zmc, String ctype) {
		if("AA203".equals(ctype)){
			//成端保存
			if("A33".equals(azylx)){
				Map<String,Object> port = getConnect(zxtbh,zzylx,zmc);
				String port_xtbh = String.valueOf(port.get("XTBH"));
				updateConnect(port_xtbh,zzylx,axtbh,azylx,amc,ctype);
			}else{
				Map<String,Object> port = getConnect(axtbh,azylx,amc);
				String port_xtbh = String.valueOf(port.get("XTBH"));
				updateConnect(port_xtbh,azylx,zxtbh,zzylx,zmc,ctype);
			}
		}else{
			//跳纤保存
			Map<String,Object> a_port = getConnect(axtbh,azylx,amc);
			String a_port_xtbh = String.valueOf(a_port.get("XTBH"));
			updateConnect(a_port_xtbh,azylx,zxtbh,zzylx,zmc,ctype);
			Map<String,Object> z_port = getConnect(zxtbh,zzylx,zmc);
			String z_port_xtbh = String.valueOf(z_port.get("XTBH"));
			updateConnect(z_port_xtbh,zzylx,axtbh,azylx,amc,ctype);
		}
	}

	/**
	 * 插入熔纤关系
	 * @param hostid 熔纤设备ID
	 * @param hostlx 熔纤设备类型
	 * @param alyid 起始路由ID
	 * @param alineid 起始路由线芯
	 * @param blyid 终止路由ID
	 * @param blineid 终止路由线芯
	 */
	public void insertLineConnect(String hostid, String hostlx, String alyid,
			String alineid, String blyid, String blineid) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("xtbh", super.getXTBH());
		params.put("hostid", hostid);
		params.put("hostlx", hostlx);
		params.put("alyid", alyid);
		params.put("alineid", alineid);
		params.put("blyid", blyid);
		params.put("blineid", blineid);
		connectMapper.insertLineConnect(params);
	}

	// =======================================================================
	// 私有辅助方法
	// =======================================================================
	/**
	 * 将客户端的拓扑图XML反序列化为对象
	 * @param XML topo xml
	 * @return 结果集
	 */
	private ElementBox deSerialize(String XML) {
		ElementBox box = new ElementBox();
		if (StringUtils.isNotBlank(XML)) {
			XMLSerializer xs = new XMLSerializer(box);
			xs.deserializeXML(XML);
		}
		return box;
	}

	/**
	 * 将拓扑对象序列化成XML
	 * @param box topo 对象
	 * @return xml
	 */
	private String serialize(ElementBox box) {
		if (box != null) {
			XMLSerializer xs = new XMLSerializer(box);
			return xs.serialize();
		}
		return "";
	}

	// =======================================================================
	// 私有静态属性，绘制拓扑相关参数
	// =======================================================================
	private static final String FRAME_BACKGROUND = "twaver/images/frame.png";// 面背景图片
	private static final String GLDLY_BACKGROUND = "twaver/images/null.png";// 光缆段背景图片
	private static final String H_MODULE_BACKGROUND = "twaver/images/h_module.png";// 框背景图片(水平)
	private static final String H_UNIT_BACKGROUND = "twaver/images/h_unit.png";// 单元板背景图片(水平)
	private static final String V_MODULE_BACKGROUND = "twaver/images/v_module.png";// 框背景图片(垂直)
	private static final String V_UNIT_BACKGROUND = "twaver/images/v_unit.png";// 单元板背景图片(垂直)
	private static final String PORT_FREE_IMAGE = "twaver/images/p_free.png";// 空闲端子图片
	private static final String PORT_USED_IMAGE = "twaver/images/p_used.png";// 占用端子图片
	private static final int DEFAULT_PORT_PADDING = 6; //端子间距
	private static final int DEFAULT_ODM_PADDING_TOPBOTTOM = 20; //ODM上下间距
	private static final int DEFAULT_AB_PADDING_TOPBOTTOM = 10; //A-B面间距
	private static final String[] UNITS = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
		"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
		"W", "X", "Y", "Z" };
	
	// =======================================================================
	// 私有属性(资源服务类，提供针对每种资源的管理)
	// =======================================================================
	@Resource(name = "jfxxServiceImpl") //机房
	private JfxxService jfxxservice;
	@Resource(name = "odfServiceImpl") //ODF
	private OdfService odfservice;
	@Resource(name = "odmServiceImpl") //ODM
	private OdmService odmservice;
	@Resource(name = "gjjxServiceImpl") //光交
	private GjjxService gjjxService;
	@Resource(name = "gfxxServiceImpl") //光分
	private GfxxService gfxxService;
	@Resource(name = "gzdhServiceImpl") //终端盒
	private GzdhService gzdhservice;
	@Resource(name = "gldlyServiceImpl") //光缆段
	private GldlyService gldlyservice;
	@Resource(name = "gjtServiceImpl") //光接头
	private GjtService gjtservice;
}
