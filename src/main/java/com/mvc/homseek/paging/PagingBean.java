package com.mvc.homseek.paging;

public class PagingBean {
	/**
	 * 총 데이터(항목)의 개수
	 */
	private int totalItems;
	/**
	 * 보고자 하는 현재 페이지
	 */
	private int page;
	/**
	 * 한 페이지에 보여질 데이터(항목)개수
	 */
	private int itemsPerPage = Constants.ITEMS_PER_PAGE;
	/**
	 * Page Group 내 Page 수.  페이지 그룹에 들어갈 페이지 개수
	 */
	private int pagesPerPagegroup = Constants.PAGES_PER_PAGEGROUP;
	
	/**
	 * 총 데이터 개수, 현재 페이지를 받아 member variable에 할당
	 * @param totalItems 총 데이터 수
	 * @param page 보려는 페이지.
	 */
	public PagingBean(int totalItems, int page) {
		this.totalItems = totalItems;
		this.page = page;
	}
	/**
	 * 보려는 페이지 번호를 리턴하는 메소드
	 * @return 보려는 페이지
	 */
	public int getPage(){
		return page;
	}
	
	/**
	 * 총 페이지 수(마지막 페이지)를 return한다.<br>
	 * 1. 전체 데이터(항목) % 한 페이지에 보여줄 데이터 개수 => 0 이면 둘을 /  값이 총 페이지 수<br>
	 * 2. 전체 데이터(항목) % 한 페이지에 보여줄 데이터 개수 => 0보다 크면 둘을 /  값에 +1을 한 값이 총 페이지 수
	 * @return
	 */
	public int getTotalPage(){
		int totalPage = 0;
		if(totalItems%itemsPerPage != 0){
			totalPage = totalItems/itemsPerPage +1;
		}else{
			totalPage = totalItems/itemsPerPage;
		}		
		return totalPage;
	}
	/**
	 * 총 페이지 그룹의 수를 계산해서 return한다.<br>
	 * 1. 총 페이지수 %  Page Group 내 Page 수.  => 0 이면 둘을 /  값이 총 페이지 수<br>
	 * 2. 총 페이지수 %  Page Group 내 Page 수.  => 0보다 크면 둘을 /  값에 +1을 한 값이 총 페이지 수
	 * @return
	 */
	private int getTotalPageGroup(){
		
		int totalPageGoup = 0;
		int totalPage = getTotalPage();//전체 페이지 수
		if(totalPage%pagesPerPagegroup != 0){
			totalPageGoup = totalPage/pagesPerPagegroup + 1;
		}else{
			totalPageGoup = totalPage/pagesPerPagegroup;
		}		
		return totalPageGoup;
	}
	/**
	 * 보려는 페이지가 속한 페이지 그룹의 번호(몇 번째 페이지 그룹인지) 을 계산해서 return 하는 메소드<br>
	 * 1. 현재 페이지 %  Page Group 내 Page 수 => 0 이면 둘을 / 값이 현재 페이지 그룹. <br>
	 * 2. 현재 페이지 %  Page Group 내 Page 수 => 0 크면 둘을 /  값에 +1을 한 값이 현재 페이지 그룹
	 * @return
	 */
	private int getCurrentPageGroup(){
		
		int currentPageGroup = 0;
		if(page%pagesPerPagegroup != 0){
			currentPageGroup = page / pagesPerPagegroup +1;
		}else{
			currentPageGroup = page / pagesPerPagegroup;
		}
		return currentPageGroup;
	}
	/**
	 * 현재 페이지(this.page) 에 보여질 시작 item의 번호(rownum번호) 조회
	 * 		마지막 item번호 - 페이지당 보여질 item수 + 1
	 * @return
	 */
	public int getBeginItemInPage(){
		return getEndItemInPage() - itemsPerPage + 1; 
	}
	/**
	 * 현재 페이지(this.page) 에 보여질 마지막 item의 번호(rownum번호) 조회
	 * 		현재페이지(this.page) * 페이지동 보여질 item수
	 * @return
	 */
	public int getEndItemInPage(){
		return page * itemsPerPage;
	}
	
	/**
	 * 보려는 페이지가 속한 페이지 그룹의 시작 페이지 번호를 계산해서 return 한다.<br>
	 * 1. Page Group 내 Page 수*(현재 페이지 그룹 -1) + 1을 한 값이 첫 페이지이다.(페이지 그룹*페이지 그룹 개수 이 그 그룹의 마지막 번호이므로)<br>
	 * 2. 위의 계산 결과가 0인 경우는 첫페이지 이므로 1을 return 한다. 
	 * @return 보려는 페이지가 속한 페이지 그룹의 시작 페이지 번호.
	 */
	public int getBeginPage(){
		if(totalItems==0) return 0;
		return (getCurrentPageGroup()-1)*pagesPerPagegroup+1;
	}
	/**
	 * 보려는 페이지가 속한 페이지 그룹의 마지막 페이지 번호를 계산해서 return 한다.<br>
	 * 1. 현재 페이지 그룹 * 페이지 그룹내 페이지 수 가 마지막 번호이다.<br>
	 * 2. 그 그룹의 마지막 페이지 번호가 전체 페이지의 마지막 페이지 번호보다 큰 경우는 전체 페이지의 마지막 번호를 return 한다. 
	 * @return 보려는 페이지가 속한 페이지 그룹의 마지막 페이지 번호
	 */
	public int getEndPage(){
		if(totalItems==0) return 0;
		int endPageNo =getCurrentPageGroup()*pagesPerPagegroup;
		if(endPageNo>getTotalPage()){//마지막page가 총 page수 보다 크다면
			endPageNo = getTotalPage();
		}		
		return endPageNo;
	}
	/**
	 * 보려는 페이지가 속한 페이지그룹의 이전 페이지 그룹이 있는지 체크한다.<br>
	 * 현재 페이지가 속한 페이지 그룹이 1보다 크면 true
	 * @return 이전페이지 그룹이 있는 경우 true, 없으면 false를 리턴
	 */
	public boolean isPreviousPageGroup(){		
		if(getCurrentPageGroup()!=1){//현재 pagegroup이 1이 아니면
			return true;
		}		
		return false;
	}
	/**
	 * 보려는 페이지가 속한 페이지그룹의 다음 페이지 그룹이 있는지 체크한다.<br>
	 * 현재 페이지 그룹이 마지막 페이지 그룹(마지막 페이지 그룹 == 총 페이지 그룹 수) 보다 작으면 true
	 * @return 다음 페이지 그룹이 있는 경우 true, 없으면 false를 리턴
	 */
	public boolean isNextPageGroup(){		
		if(getCurrentPageGroup() < getTotalPageGroup()){
			return true;
		}		
		return false;
	}

}
