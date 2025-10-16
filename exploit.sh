#!/system/bin/sh

echo "Family Link Unrestricted User Creator"
echo "this is patched after September 2025 security update!!"

echo "Temporarily disabling supervision..."

# Check if the profile owner is the .supervision package or gms by itself
if dpm list-owners | grep -q "com.google.android.gms.supervision/com.google.android.gms.kids.account.receiver.ProfileOwnerReceiver"; then
    # Supervision package
    am start-in-vsync -n com.google.android.gms.supervision/com.google.android.gms.kids.DisableSupervisionActivity
else
    # GMS
    am start-in-vsync -n com.google.android.gms/com.google.android.gms.kids.DisableSupervisionActivity
fi

echo "Sleeping for 5 seconds..."
sleep 5
echo "Creating user..."
echo $(pm create-user "newuser")
echo -e "Re-enabling supervision...\n"
echo -e "Please click 'Allow' on the prompt to re-enable supervision"
echo -e "After that, go to Settings > System > Multiple Users, set up the new user, then reboot. Then you are done!"
am start com.google.android.gms/com.google.android.gms.kids.chimera.RegisterProfileOwnerActivityProxy
