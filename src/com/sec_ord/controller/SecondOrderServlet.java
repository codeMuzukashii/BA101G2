package com.sec_ord.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberService;
import com.motor.model.MotorService;
import com.motor.model.MotorVO;
import com.motor_model.model.MotorModelService;
import com.motor_model.model.MotorModelVO;
import com.sec_ord.model.*;

public class SecondOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("buildOrder".equals(action)){
			
			
			String location = req.getParameter("location");
			System.out.println("我來自~~~"+location);
			String motno = req.getParameter("motno");
			System.out.println("想買的車輛編號是~~~"+motno);
			String memno = req.getParameter("memno");
			System.out.println("我是會員 編號是~~~~"+memno);
			
			SecOrdService soSvc = new SecOrdService();
			MotorService motorSvc = new MotorService();
			motorSvc.updateStatusByHib(motno, "secreserved");
			SecOrdVO soVO = soSvc.addSecOrd(memno, motno);
			MemberService memSvc = new MemberService();
			 req.setAttribute("memno", memno);
			 req.setAttribute("motno", motno);
			 req.setAttribute("memVO", memSvc.getOneMember(memno));
			 req.setAttribute("soVO", soVO);
			 String url = "/frontend/member/frontMember.jsp";
			 RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
		     successView.forward(req, res); 
			
			
			  
		}
		
		
		
		
		
		
		if("DEAL".equals(action)){
			
			String location = req.getParameter("location");
			System.out.println("我來自~~~"+location);
			String motno = req.getParameter("motno");
			System.out.println("想買的車輛編號是~~~"+motno);
			String memno = req.getParameter("memno");
			System.out.println("我是會員 編號是~~~~"+memno);
			
			
			 req.setAttribute("memno", memno);
			 req.setAttribute("motno", motno);
			 String url = "/frontend/second_order/payMoney.jsp";
			 RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
		     successView.forward(req, res); 
			
		}
		
		
		
		
		
		
		if("I_WANT_IT".equals(action))
		{
			String memno = (String)req.getSession().getAttribute("memno");
			String status = (String)req.getSession().getAttribute("status");
			String motno = req.getParameter("motno");
			String location = req.getParameter("location");
			System.out.println(location);
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			 if(memno == null || !status.equals("confirmed"))
			 {
				  errorMsgs.add("沒有購買資格，請登入並完成認證程序");
				  req.setAttribute("error", errorMsgs.get(0));
				  String url = "/index.jsp";
				  req.setAttribute("location", location);  
				  RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				  successView.forward(req, res);
			 }
			 else
			 {
				    MotorService motorSvc = new MotorService();
				    MotorVO motorVO = motorSvc.findByPK(motno);
				    MotorModelService mmSvc = new MotorModelService();
				    MotorModelVO mmVO = mmSvc.findByPK(motorVO.getModtype());
				    req.setAttribute("motorVO", motorVO);
				    req.setAttribute("mmVO", mmVO);
				    String url = "/frontend/second_order/listOneSecond.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
					successView.forward(req, res); 
			 }
			
		}
	
		
		
		
		
		
		
		if("getOneMotor_OnOffSale".equals(action))
		{
			
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String motno = req.getParameter("motno");
				System.out.println("車輛編號是"+motno);
				String who = (String)req.getParameter("who");
				System.out.println("腳色是"+who);
				
				/*************************** 2.開始查詢資料 *****************************************/
				MotorService motSvc = new MotorService();
				
				MotorVO motorVO = motSvc.findByPK(motno);
			    motorVO.setStatus(motorVO.getStatus().equals("secpause")? "seconsale" : "secpause");			
			    motorVO= motSvc.updateMotor(motorVO.getMotno(), motorVO.getModtype(), motorVO.getPlateno(), motorVO.getEngno(), motorVO.getManudate(), motorVO.getMile(), motorVO.getLocno(), motorVO.getStatus(), motorVO.getNote());
				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
			    req.setAttribute("who", who);
			    req.setAttribute("motorVO", motorVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/second_order/SaleOnOff.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/select_page.jsp");
//				failureView.forward(req, res);
//			}
			
			
			
			
			
			
			
			
		}
		
		if ("getAll_For_Display_By_Memno_Status".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String memno = req.getParameter("memno");
				String status = req.getParameter("status");
				List<SecOrdVO> list1 = null;
				/*************************** 2.開始查詢資料 *****************************************/
				SecOrdService soSvc = new SecOrdService();
				if(status.equals("all"))
				{
			         list1 = soSvc.getAll();
				}
				else
				{
		          list1 = soSvc.getAll(status);
				}
				List<SecOrdVO> list2 = new ArrayList<SecOrdVO>();
				for(SecOrdVO ord : list1)
				{
					if(ord.getMemno().equals(memno))
					{
						list2.add(ord);
					}
					
				}
			
				
				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/

				req.setAttribute("list", list2); // 資料庫取出的empVO物件,存入req
				req.setAttribute("status", status);
				String url = "/frontend/second_order/listAllSecOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		
		
		
		
		
		if ("getAll_For_Display_By_Memno".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String memno = req.getParameter("memno");

				/*************************** 2.開始查詢資料 *****************************************/
				SecOrdService soSvc = new SecOrdService();
				List<SecOrdVO> list1 = soSvc.getAll();
				List<SecOrdVO> list2 = new ArrayList<SecOrdVO>();
				for(SecOrdVO ord : list1)
				{
					if(ord.getMemno().equals(memno))
					{
						list2.add(ord);
					}
					
				}
			
				
				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("memno", memno);
				req.setAttribute("list", list2); // 資料庫取出的empVO物件,存入req
				req.setAttribute("status", "all");
				String url = "/frontend/second_order/listAllSecOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String sono = req.getParameter("sono");
				String memno = req.getParameter("memno");

				if ((sono == null || (sono.trim()).length() == 0) && (memno == null || (memno.trim()).length() == 0)) {

					errorMsgs.add("請輸入訂單或會員編號");
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SecOrdService soSvc = new SecOrdService();
				SecOrdVO soVO = null;
				if (sono != null)
					soVO = soSvc.getOneSecOrdBySono(sono);
				else
					soVO = soSvc.getOneSecOrdByMemno(memno);
				if (soVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/

				req.setAttribute("soVO", soVO); // 資料庫取出的empVO物件,存入req
				String url = "/frontend/second_order/listOneSecOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp 或
													// /dept/listEmps_ByDeptno.jsp
													// 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String status = req.getParameter("Order_Status");
				String sono = req.getParameter("sono");
				/*************************** 2.開始查詢資料 ****************************************/
				SecOrdService soSvc = new SecOrdService();
				SecOrdVO soVO = soSvc.getOneSecOrdBySono(sono);
                soSvc.updateSecOrd(soVO.getMemno(), soVO.getMotorno(),
                		soVO.getBuildtime(),status,sono);
				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 ************/
                req.setAttribute("status", status);
				req.setAttribute("soVO", soVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/second_order/update_SecOrd_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ************************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String sono = req.getParameter("sono");
				String motno = req.getParameter("motno");
				String memno = req.getParameter("memno");
				Timestamp sodate =Timestamp.valueOf( req.getParameter("sodate"));
				String status = req.getParameter("status");
				System.out.println("我要改狀態~~~~~~~~~~~~~~~~"+status);
				SecOrdVO soVO = null;

			

				/*************************** 2.開始修改資料 *****************************************/
				SecOrdService soSvc = new SecOrdService();
				soVO = soSvc.updateSecOrd( memno, motno, sodate, status, sono );
                MotorService motorSvc = new MotorService();
                motorSvc.updateStatusByHib(motno, "secsaled");
				/***************************
				 * 3.修改完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("soVO", soVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/backend/second_order/listOneSecOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/second_order/update_SecOrd_input.jsp");
				failureView.forward(req, res);
			}
		}

		
		
		if ("listSecOrd_ByStatus".equals(action)) { // 來自ListAllSecOrd.jsp的請求
           System.out.println("近來狀態查詢");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				/***********************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 *************************/
				String status = req.getParameter("status");
				String memno = req.getParameter("memno");
				System.out.println("欲查詢狀態:"+status+" 會員編號:"+memno);
				

				

				/***************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 ***********/
				req.setAttribute("status", status);
				req.setAttribute("memno", memno);
				String url = "/backend/second_order/listAllSecOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				//
				// /*************************** 其他可能的錯誤處理
				// **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/listAllSecOrd.jsp");
//				failureView.forward(req, res);
//			}
		}
		
		if ("insert".equals(action)) { // 來自addSpot.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 *************************/
				String memno = req.getParameter("memno").trim();
				String motno = req.getParameter("motno").trim();

				SecOrdVO soVO = new SecOrdVO();
				soVO.setMotorno(motno);
				soVO.setMemno(memno);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("soVO", soVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/addSecOrd.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				SecOrdService soSvc = new SecOrdService();
				soVO = soSvc.addSecOrd(memno, motno);

				/***************************
				 * 3.新增完成,準備轉交(Send the Success view)
				 ***********/
				String url = "/frontend/second_order/listAllSecOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				//
				// /*************************** 其他可能的錯誤處理
				// **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/second_order/addSecOrd.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑:
																// 可能為【/emp/listAllEmp.jsp】
																// 或
																// 【/dept/listEmps_ByDeptno.jsp】
																// 或 【
																// /dept/listAllDept.jsp】

			try {
				/*************************** 1.接收請求參數 ***************************************/
				 String sono = req.getParameter("sono");
				/*************************** 2.開始刪除資料 ***************************************/
				 SecOrdService soSvc = new SecOrdService();

				 soSvc.deleteSecOrd(sono);

				/***************************
				 * 3.刪除完成,準備轉交(Send the Success view)
				 ***********/
				// DeptService deptSvc = new DeptService();
				// if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") ||
				// requestURL.equals("/dept/listAllDept.jsp"))
				// req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno()));
				// // 資料庫取出的list物件,存入request
				//
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				//
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
	}
}
