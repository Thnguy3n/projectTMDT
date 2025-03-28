package com.javabackend.shop.state;

import com.javabackend.shop.state.Impl.DeliveredState;
import com.javabackend.shop.state.Impl.PendingState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class OrderStateContext {
    private final PendingState pendingState;
    private final DeliveredState deliveredState;

    @Autowired
    public OrderStateContext(PendingState pendingState, DeliveredState deliveredState) {
        this.pendingState = pendingState;
        this.deliveredState = deliveredState;
    }

    public OrderState getState(String status) {
        if(status.equals("Đang xử lý")){
            return pendingState;
        } else if (status.equals("Đã giao hàng")) {
            return deliveredState;
        }
        throw new IllegalArgumentException("Trạng thái không hợp lệ");
    }
}
