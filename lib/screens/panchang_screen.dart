import 'package:flutter/material.dart';

class PanchangScreen extends StatelessWidget {
  const PanchangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            /// 🔥 LIGHT OVERLAY

            /// 🔥 CONTENT
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TITLE
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Panchang for Today",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Share today's celestial insights with your family members",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// 🔥 MAIN CARD
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.orange.shade100),

                          /// 🔥 BACKGROUND INSIDE CARD
                          image: const DecorationImage(
                            image: AssetImage('assets/bagroundimage.png'),
                            fit: BoxFit.cover,
                            opacity: 0.85,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TOP DECORATION
                            Center(
                              child: Container(
                                height: 2,
                                width: 120,
                                color: Colors.orange,
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// DATE + SUN
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "MANGALVAAR",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "31",
                                          style: TextStyle(
                                            fontSize: 42,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text("Mar\n2026"),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF3E0),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: const [
                                      Icon(Icons.wb_sunny,
                                          color: Colors.orange),
                                      SizedBox(height: 5),
                                      Text("Sunrise\n6:24 AM",
                                          textAlign: TextAlign.center),
                                      SizedBox(height: 5),
                                      Text("Sunset\n6:38 PM",
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// GRID
                            Row(
                              children: const [
                                Expanded(
                                  child: _InfoColumn(
                                    title: "TITHI",
                                    value: "Trayodashi\nUpto 06:56 AM",
                                  ),
                                ),
                                Expanded(
                                  child: _InfoColumn(
                                    title: "VAAR",
                                    value: "Mangalvaara",
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: const [
                                Expanded(
                                  child: _InfoColumn(
                                    title: "NAKSHATRA",
                                    value: "Purva Phalguni\nUpto 01:12 PM",
                                  ),
                                ),
                                Expanded(
                                  child: _InfoColumn(
                                    title: "YOGA",
                                    value: "Shula",
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: const [
                                Expanded(
                                  child: _InfoColumn(
                                    title: "KARANA",
                                    value: "Taitila",
                                  ),
                                ),
                                Expanded(
                                  child: _InfoColumn(
                                    title: "PAKSHA",
                                    value: "Shukla Paksha",
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: const [
                                Expanded(
                                  child: _InfoColumn(
                                    title: "RITU",
                                    value: "Vasanta",
                                  ),
                                ),
                                Expanded(
                                  child: _InfoColumn(
                                    title: "AYANA",
                                    value: "Uttarayan",
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: const [
                                Expanded(
                                  child: _InfoColumn(
                                    title: "SAMVAT",
                                    value: "2082 Pingala",
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// CURRENT TIMINGS
                            const Text(
                              "• CURRENT TIMINGS",
                              style: TextStyle(color: Colors.red),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Rahu Kaal\n03:32 PM - 05:04 PM"),
                                Text("Udveg\n02:32 PM - 06:04 PM"),
                              ],
                            ),

                            const SizedBox(height: 20),

                            /// FOOTER
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: const [
                                  Icon(Icons.temple_hindu, color: Colors.white),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "Aumraa\nSPIRITUAL COMPANION",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// BUTTON
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Share Panchang"),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔥 REUSABLE COMPONENT
class _InfoColumn extends StatelessWidget {
  final String title;
  final String value;

  const _InfoColumn({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}
