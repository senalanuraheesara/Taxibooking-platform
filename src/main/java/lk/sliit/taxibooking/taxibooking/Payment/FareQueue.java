package lk.sliit.taxibooking.taxibooking.Payment;

import java.util.Queue;
import java.util.LinkedList;

public class FareQueue {


    public class BookingQueue {
        private final Queue<String> queue = new LinkedList<>();

        public void addBooking(String bookingDetails) {
            queue.add(bookingDetails);
        }

        public String getNextBooking() {
            return queue.poll();  // returns and removes the head
        }

        public boolean isEmpty() {
            return queue.isEmpty();
        }
    }
}
