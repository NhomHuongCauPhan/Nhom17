package com.giaphavietnam.utils;

import java.util.ArrayList;

import com.giaphavietnam.model.IndividualModel;

public class GenerateTree {
	public static String viewIndividual(ArrayList<IndividualModel> items) {
		int doi;		
		String tmp = "";
		tmp +="<div class=\"rcontent-item item3\" >";

		for (IndividualModel item : items) {
			doi = item.getBranch().split("\\.").length + 1;
									
			for(int i = 0; i < doi; i++) {
				tmp +="&nbsp;&nbsp;&nbsp;&nbsp;";
			}
			
		
			tmp +="<img align=\"absmiddle\" src=\"/HuongCauPhan/template/adimgs/plus4.gif\" style=\"padding: 0px; margin: 0px; width: 18px; height: 18px;\" id=\"img0\" onclick=\"img1()\">";
			tmp +="<img src=\"/HuongCauPhan/template/adimgs/m.jpg\" align=\"absmiddle\" style=\"width: 18px; height: 18px;\" id=\"img1\">";
			tmp +="<button class=\"tree !important\">"+ item.getFullName() +"</button>";
			tmp +="<button class=\"tree tree1 !important\" onclick=\"openedit("+item.getIndividualId()+")\"><img src=\"/HuongCauPhan/template/adimgs/pencil.png\" width=\"14px\" heigh=\"14px\"></button>";
			tmp +="<button class=\"tree tree1 !important\" onclick=\"del("+item.getIndividualId()+",\'"+item.getFullName()+"\')\"><img src=\"/HuongCauPhan/template/adimgs/delete.png\" width=\"14px\" heigh=\"14px\"></button>";
			tmp +="</br>";
		}

		tmp +="</div>";
		return tmp;
	}
}
