package com.poseidon.dto;
// 멤버테이블 모든 컬럼을 저장하는 DTO 만들기

public class MemberDTO {
	private int mno, mgrade, count;
	private String mid, mpw, mname, mdate;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getMgrade() {
		return mgrade;
	}
	public void setMgrade(int mgrade) {
		this.mgrade = mgrade;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	
	
	
}