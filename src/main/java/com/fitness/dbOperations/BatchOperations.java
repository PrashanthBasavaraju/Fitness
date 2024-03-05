package com.fitness.dbOperations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fitness.connection.DBConnection;
import com.fitness.models.Batch;

public class BatchOperations {
	 private Connection connection = null;
	    private PreparedStatement preparedStatement;

	    public BatchOperations() throws Exception {
	        connection = DBConnection.getConnection();
	    }

	    public String addNewBatch(Batch batch) throws SQLException {
	        String result = "Err";
	        try {
	            preparedStatement = connection.prepareStatement("INSERT INTO Batch(name, time) VALUES (?, ?)");
	            preparedStatement.setString(1, batch.getName());
	            preparedStatement.setString(2, batch.getTime());

	            int changes = preparedStatement.executeUpdate();
	            if (changes >= 1)
	                result = "Success";

	        } catch (Exception e) {
	            result = "Err";
	            System.out.println(e);
	        }
	        return result;
	    }

	    public List<Batch> viewAllBatches() {
	        List<Batch> batchList = new ArrayList<>();
	        Batch batch = null;
	        try {
	            preparedStatement = connection.prepareStatement("SELECT * FROM Batch");
	            ResultSet resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	                batch = new Batch();
	                batch.setBid(resultSet.getInt("bid"));
	                batch.setName(resultSet.getString("name"));
	                batch.setTime(resultSet.getString("time"));
	                batchList.add(batch);
	            }
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        return batchList;
	    }

	    public Batch searchBatch(int bid) {
	        Batch batch = null;
	        try {
	            preparedStatement = connection.prepareStatement("SELECT * FROM Batch WHERE bid = ?");
	            preparedStatement.setInt(1, bid);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            if (resultSet.next()) {
	                batch = new Batch();
	                batch.setBid(resultSet.getInt("bid"));
	                batch.setName(resultSet.getString("name"));
	                batch.setTime(resultSet.getString("time"));
	            }
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        return batch;
	    }

	    public String updateBatchNameAndTime(Batch batch) throws SQLException {
	        String result = "Err";
	        try {
	            preparedStatement = connection.prepareStatement("UPDATE Batch SET name = ?,time=? WHERE bid = ?");
	            preparedStatement.setString(1, batch.getName());
	            preparedStatement.setString(2, batch.getTime());
	            preparedStatement.setInt(3, batch.getBid());
	            int changes = preparedStatement.executeUpdate();
	            if (changes >= 1)
	                result = "Success";

	        } catch (Exception e) {
	            result = "Err";
	            System.out.println(e);
	        }
	        return result;
	    }

	    public String deleteBatch(int bid) throws SQLException {
	        String result = "Err";
	        try {
	            preparedStatement = connection.prepareStatement("DELETE FROM Batch WHERE bid = ?");
	            preparedStatement.setInt(1, bid);
	            int changes = preparedStatement.executeUpdate();
	            if (changes >= 1)
	                result = "Success";

	        } catch (Exception e) {
	            result = "Err";
	            System.out.println(e);
	        }
	        return result;
	    }

}
