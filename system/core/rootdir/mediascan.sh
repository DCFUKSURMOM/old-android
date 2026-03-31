#!/system/bin/sh
# Clear the media database
pm clear com.android.providers.media
# Force a rescan
am broadcast -a android.intent.action.MEDIA_MOUNTED -d file:///mnt/sdcard