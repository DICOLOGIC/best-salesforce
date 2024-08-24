// Important: you need to set "Allows Apex code to set and remove approval process locks." in the Process Automation settings
public with sharing class RecordLockUnlockHandler {

    @InvocableMethod(
        label='Record Lock/Unlock Handler' 
        description='Locks, unlocks, or ignores records based on the specified action. Valid actions are "LOCK", "UNLOCK", "IGNORE".'
    )
    public static void processRecords(List<Request> requests) {
        List<Id> recordsToLock = new List<Id>();
        List<Id> recordsToUnlock = new List<Id>();

        for (Request request : requests) {
            try {
                if (request.recordId == null || request.action == null) {
                    System.debug('Record ID or Action is null. Skipping this request.');
                    continue;
                }

                String action = request.action.trim().toUpperCase();
                if (action == 'LOCK') {
                    recordsToLock.add(request.recordId);
                } else if (action == 'UNLOCK') {
                    recordsToUnlock.add(request.recordId);
                } else if (action == 'IGNORE') {
                    // Do nothing
                } else {
                    System.debug('Invalid action provided: ' + request.action + '. Valid actions are LOCK, UNLOCK, IGNORE.');
                }
            } catch(System.NoAccessException e) {
                System.debug('No access to lock records: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            } catch (System.UnexpectedException e) {
                System.debug('Unexpected error processing record with ID: ' + request.recordId + '. Error: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            } catch (Exception e) {
                System.debug('General error processing record with ID: ' + request.recordId + '. Error: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            }
        }

        // Perform the locking
        if (!recordsToLock.isEmpty()) {
            try {
                Approval.Lock(recordsToLock, false);
                System.debug('Successfully locked ' + recordsToLock.size() + ' record(s).');
            } catch(System.NoAccessException e) {
                System.debug('No access to lock records: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            } catch (System.UnexpectedException e) {
                System.debug('Unexpected error locking records: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            } catch (Exception e) {
                System.debug('General error locking records: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            }
        }

        // Perform the unlocking
        if (!recordsToUnlock.isEmpty()) {
            try {
                Approval.Unlock(recordsToUnlock);
                System.debug('Successfully unlocked ' + recordsToUnlock.size() + ' record(s).');
            } catch(System.NoAccessException e) {
                System.debug('No access to lock records: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            } catch (System.UnexpectedException e) {
                System.debug('Unexpected error unlocking records: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            } catch (Exception e) {
                System.debug('General error unlocking records: ' + e.getMessage());
                System.debug('Stack trace: ' + e.getStackTraceString());  // Log the stack trace
            }
        }
    }

    public class Request {
        @InvocableVariable(required=true label='Id of record to Lock/Unlock' description='The record to lock, unlock, or ignore.')
        public Id recordId;

        @InvocableVariable(required=true label='Action' description='The action to perform on the record. Valid actions are LOCK, UNLOCK, IGNORE.')
        public String action;
    }
}