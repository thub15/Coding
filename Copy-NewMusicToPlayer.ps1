#Tom Hubbard, 10-19-2021
#Copy only new music to mp3 player, saves time by only copying items that don't exist on the destination.
#Leaving the hardcoded directories and paths in here, sometimes too much variable substitution is confusing for newer PS users.

#Gets all of the albums in the source directory such as your music library
$albumsInLibrary = gci -Directory -path "C:\users\tom\OneDrive\Music" | select -ExpandProperty Name

#Gets all of the albums of your destination folder, such as your mp3 player
$albumsOnPlayer = gci -Directory -Path "e:\" | select -ExpandProperty name

#For illustration, it will list the differences between the music library and the music player.
Compare-Object -DifferenceObject $albumsInLibrary -ReferenceObject $albumsOnPlayer

#Loop through each album in the library
foreach ($album in $albumsInLibrary)
{
    #Check to see if the music player contains everything in the music library
    if ($albumsOnPlayer -notcontains $album)
{
    #If the album doesn't exist on the music player, copy it and it's child items from the library to the player
    write-host "$album is not on music player, copying to music player" -ForegroundColor Cyan
    Copy-Item -path "C:\users\Tom\OneDrive\music\$album" -Recurse -Destination e:\$album
}
}
