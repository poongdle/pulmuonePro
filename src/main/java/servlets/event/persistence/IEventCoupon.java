package servlets.event.persistence;

import java.sql.Connection;
import java.sql.SQLException;

import servlets.event.domain.CouponDTO;
import servlets.event.domain.HaveCouponDTO;

public interface IEventCoupon {

	int setCoupon(Connection conn, HaveCouponDTO coupon) throws SQLException;
	
	public CouponDTO getCoupon(Connection conn, int coupon_no) throws SQLException;
	
	boolean checkDuplicateCoupon(Connection conn, int couponNo, int memberNo) throws SQLException;
	
}
