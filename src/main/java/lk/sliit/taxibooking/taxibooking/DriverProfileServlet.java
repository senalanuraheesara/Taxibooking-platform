/* Fixed version of DriverProfileServlet.java */
package lk.sliit.taxibooking.taxibooking;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.taxibooking.taxibooking.fileHandler.DriverFileHandler;

import java.io.*;
import java.util.*;

@WebServlet("/DriverProfileServlet")
public class DriverProfileServlet extends HttpServlet {
    public static final String usersPath = "C:\\Users\\Udama\\Documents\\Taxibooking-udama[1]\\Taxibooking-udama\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\users.txt";
    public static final String detailsPath = "C:\\Users\\Udama\\Documents\\Taxibooking-udama[1]\\Taxibooking-udama\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\driverDetails.txt";
    public static final String reviewsPath = "C:\\Users\\Udama\\Documents\\Taxibooking-udama[1]\\Taxibooking-udama\\Taxibooking\\Taxibooking\\src\\main\\webapp\\WEB-INF\\reviews.txt";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        DriverDetails currentDriver = (DriverDetails) session.getAttribute("driver");

        if (currentDriver == null) {
            String userID = (String) session.getAttribute("userID");
            if (userID == null) {
                userID = request.getParameter("userID");
            }

            if (userID != null) {
                List<DriverDetails> drivers = DriverFileHandler.loadDriversFromFile(usersPath);
                for (DriverDetails d : drivers) {
                    if (d.getUserID().equals(userID)) {
                        currentDriver = d;
                        session.setAttribute("driver", currentDriver);
                        break;
                    }
                }
            }
        }

        if (currentDriver == null) {
            System.out.println("⚠️ Driver not found.");
            response.sendRedirect("driverDashboard.jsp");
            return;
        }

        List<DriverDetails> driverDetailsList = DriverFileHandler.loadDriversFromDetailsFile(detailsPath);

        currentDriver.setLicenseNumber(request.getParameter("licenseNumber"));
        currentDriver.setVehicleType(request.getParameter("vehicleType"));
        currentDriver.setWorkStatus(request.getParameter("workStatus"));
        currentDriver.setExperience(Integer.parseInt(request.getParameter("experience")));

        boolean updated = false;
        for (int i = 0; i < driverDetailsList.size(); i++) {
            if (driverDetailsList.get(i).getUserID().equals(currentDriver.getUserID())) {
                driverDetailsList.set(i, currentDriver);
                updated = true;
                break;
            }
        }

        if (!updated) {
            driverDetailsList.add(currentDriver);
        }

        // Optional: load ratings before writing
        DriverFileHandler.loadRatingsFromFile(driverDetailsList, reviewsPath);
        DriverFileHandler.sortDriversByRating(driverDetailsList);

        try {
            DriverFileHandler.writeDriversToFile(driverDetailsList, detailsPath);
            System.out.println("✅ Profile saved to driverDetails.txt");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("❌ Error writing to driverDetails.txt");
        }

        session.setAttribute("driver", currentDriver);
        response.sendRedirect("driverDashboard.jsp");
    }
}

/* No change is required in DriverFileHandler.java if it's already correctly writing.
   But make sure 'writeDriversToFile()' method is triggered only after licenseNumber is not null.
*/
