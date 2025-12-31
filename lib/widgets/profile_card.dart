import 'package:flutter/material.dart';
import 'package:task/models/profile_model.dart';

class ProfileCard extends StatelessWidget {
  final ProfileModel profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(profile.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Top Chips
          Positioned(
              top: 8,
              left: 8,
              child: Container(
                height: 32,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.remove_red_eye,size: 18,color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Text("${profile.views}",style: TextStyle(
                          color: Colors.white
                      ),),
                    )
                  ],
                ),
              )
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              height: 32,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.surround_sound_outlined,size: 18,color: Colors.redAccent,),
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Text("Pk",style: TextStyle(
                      color: Colors.white
                    ),),
                  )
                ],
              ),
            )
          ),

          // Bottom Info
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Row(
              children: [
                const CircleAvatar(radius: 14),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text(profile.country,
                        style:
                        const TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
                const Spacer(),
                const Text('🇮🇳'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
